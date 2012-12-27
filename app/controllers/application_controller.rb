class ApplicationController < ActionController::Base
  protect_from_forgery

  expose(:sections)
  expose(:section)
end
