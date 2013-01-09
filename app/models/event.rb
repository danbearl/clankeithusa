class Event < ActiveRecord::Base
  attr_accessible :description, :ends_at, :starts_at, :title

  validate :must_not_end_before_it_starts
  validates_presence_of :starts_at, :ends_at

  scope :before, lambda {|end_time| {conditions: ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {conditions: ["starts_at > ?", Event.format_date(start_time)] }}

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  def self.param_to_date(params)
    Time.utc(params[:year].to_i, params[:month].to_i, params[:day].to_i)
  end

  def must_not_end_before_it_starts
    if ends_at and starts_at
      if ends_at < starts_at
        errors.add(:ends_at, "can't end before start date.")
      end
    end
  end
end
