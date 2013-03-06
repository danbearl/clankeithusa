class AnnouncementsController < ApplicationController
  skip_before_filter :require_admin, only: :show

  expose(:announcements)
  expose(:announcement)
  expose(:new_announcement, model: Announcement)

  def create
    if new_announcement.save
      redirect_to announcements_path, notice: "Announcement successfully created."
    else
      render 'new'
    end
  end
  
  def update
    if announcement.save
      redirect_to announcements_path, notice: "Announcement successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    announcement.destroy
    redirect_to announcements_path, notice: "Announcement #{announcement.name} was deleted."
  end

end
