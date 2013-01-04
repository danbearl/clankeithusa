class EventsController < ApplicationController
  expose(:events)
  expose(:events_scoped) do |events|
    events = Event.scoped
    events = events.after(params[:start]) if (params[:start])
    events = events.before(params[:end]) if (params[:end])
  end
  expose(:event)
  expose(:new_event, model: Event)

  def index

    if params[:start_date]
      params[:start] = Event.param_to_date(params[:start_date])
    end

    if params[:end_date]
      params[:end] = Event.param_to_date(params[:end_date])
    end

    if !params[:start]
      params[:start] = Time.utc(Time.now.year, Time.now.month, 1)
    end

    if !params[:end]
      params[:end] = Time.utc(Time.now.year, Time.now.month, 31)
    end

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

end
