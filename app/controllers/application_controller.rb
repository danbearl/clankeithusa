class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_is_admin?, :require_admin

  include Authem::ControllerSupport

  expose(:pages) { Page.reorder(:priority) }
  expose(:sections) do
    pages.where(:parent_id => 0).reorder(:priority)
  end
  expose(:page_slugs ) { Page.select(:slug).map(&:slug) }

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
