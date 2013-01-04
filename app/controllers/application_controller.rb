class ApplicationController < ActionController::Base
  protect_from_forgery

  include Authem::ControllerSupport

  expose(:pages)
  expose(:sections) do
    pages.where(:parent_id => nil)
  end
end
