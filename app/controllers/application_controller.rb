class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_is_admin?

  include Authem::ControllerSupport

  expose(:pages)
  expose(:sections) do
    pages.where(:parent_id => nil)
  end

  def user_is_admin?
    if current_user
      return current_user.admin
    else
      return false
    end
  end
end
