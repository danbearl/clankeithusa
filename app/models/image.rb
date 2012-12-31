class Image < ActiveRecord::Base
  attr_accessible :description, :imageable_id, :imageable_type, :name, :picture, :priority

  belongs_to :imageable, polymorphic: true

  mount_uploader :picture, PictureUploader
end
