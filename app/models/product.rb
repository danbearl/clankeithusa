class Product < ActiveRecord::Base
  attr_accessible :colors, :description, :image, :name, :price, :sizes, :image

  mount_uploader :image, ProductImageUploader

  def list_colors
    if self.colors.blank?
      return false
    end

    self.colors.gsub(" ","").split(",")
  end

  def list_sizes
    if self.sizes.blank?
      return false
    end

    self.sizes.gsub(" ","").split(",")
  end

end
