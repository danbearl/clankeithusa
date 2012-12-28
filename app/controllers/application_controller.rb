class ApplicationController < ActionController::Base
  protect_from_forgery

  expose(:pages)
  expose(:sections) do
    pages.where(:parent_id => nil)
  end
end
