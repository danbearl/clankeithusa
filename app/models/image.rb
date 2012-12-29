class Image < ActiveRecord::Base
  attr_accessible :description, :imageable_id, :imageable_type, :name, :picture, :priority
end
