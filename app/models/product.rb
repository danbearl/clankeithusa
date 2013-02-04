class Product < ActiveRecord::Base
  attr_accessible :colors, :description, :image, :name, :price, :sizes
end
