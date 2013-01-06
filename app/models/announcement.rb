class Announcement < ActiveRecord::Base
  attr_accessible :body, :front_page, :name, :site_wide

  default_scope order('created_at DESC, updated_at DESC')
end
