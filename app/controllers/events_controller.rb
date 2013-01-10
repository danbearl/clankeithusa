class EventsController < ApplicationController

  before_filter :require_admin, except: [:index, :show]

  expose(:events)
  expose(:events_scoped) do |events|
    events = Event.scoped
    events = events.after(@start_date)
    events = events.before(@end_date)
    events.reorder(:starts_at)
  end
  expose(:event)
  expose(:new_event, model: Event)

  def index
    begin
      @start_date = Date.parse(params[:start])
    rescue
      @start_date = Date.new(Date.today.year, Date.today.month, 1)
    end

    begin
      @end_date = Date.parse(params[:end])
    rescue
      @end_date = Date.new(Date.today.year, Date.today.month, 31)
    end

    @grouped_events = group_events(events_scoped)

    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  end

  def create
    if new_event.save
      redirect_to events_path, notice: "Event successfully created."
    else
      render 'new'
    end
  end

  def update
    if event.save
      redirect_to events_path, notice: "Event successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    event.destroy
    redirect_to events_path, notice: "Event successfully deleted."
  end

  def group_events(events)
    years = {}

    events.each do |event|
      if !years.has_key?(event.starts_at.year)
        years[event.starts_at.year] = {}
      end
    end

    events.each do |event|
      if !years[event.starts_at.year].has_key?(event.starts_at.month)
        years[event.starts_at.year][event.starts_at.month] = []
      end
      years[event.starts_at.year][event.starts_at.month] << event
    end

    return years
  end

end
