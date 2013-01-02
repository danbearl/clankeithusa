class EventsController < ApplicationController

  expose(:events)
  expose(:event)
  expose(:new_event, model: Event)

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
    redirect_to :root, notice: "Event successfully deleted."
  end

end
