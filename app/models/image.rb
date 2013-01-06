class Image < ActiveRecord::Base
  attr_accessible :description, :page_id, :name, :picture, :priority

  belongs_to :page

  mount_uploader :picture, PictureUploader
end
