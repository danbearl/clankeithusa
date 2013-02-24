class Comment < ActiveRecord::Base

  attr_accessible :body, :author, :approved

  validates_presence_of :body
  validates_presence_of :author

  def approve
    update_attributes(approved: true)

  end

end
