class ApplicationController < ActionController::Base
  protect_from_forgery

  expose(:pages) {Pages.where("page_id = nil")}
end
