class Announcement < ActiveRecord::Base
  attr_accessible :body, :front_page, :name, :site_wide
end
