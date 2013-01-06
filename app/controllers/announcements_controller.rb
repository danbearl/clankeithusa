class AnnouncementsController < ApplicationController
  skip_before_filter :require_admin, only: :show

  expose(:announcements)
  expose(:announcement)
  expose(:new_announcement, model: Announcement)

  def create
    if new_announcement.save
      redirect_to announcements_path
    else
      render 'new'
    end
  end
  
  def update
    if announcement.save
      redirect_to announcements_path
    else
      render 'edit'
    end
  end

  def destroy
    announcement.destroy
    redirect_to :root, message: "#{announcement.name} was deleted."
  end

end
