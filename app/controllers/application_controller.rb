class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_is_admin?, :require_admin

  include Authem::ControllerSupport

  expose(:pubished_pages) { Page.where(draft: false).reorder(:priority) }
  expose(:sections) do
    Page.where(
      parent_id: 0,
      draft: false
    ).reorder(:priority)
  end
  expose(:page_slugs ) { Page.select(:slug).map(&:slug) }
  expose(:site_wide_announcements) do
    Announcement.where(
      live: true,
      site_wide: true
    )
  end

  private

  def user_is_admin?
    if current_user
      return current_user.admin
    else
      return false
    end
  end

  def require_admin
    unless user_is_admin?
      redirect_to root_path
    end
  end
end
