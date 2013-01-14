class Page < ActiveRecord::Base

  has_many :sub_pages, class_name: "Page",
    foreign_key: "parent_id"
  belongs_to :parent, class_name: "Page"
  has_many :images
  has_many :blurbs
  
  attr_accessible :body, :name, :slug, :parent_id, :public, :priority

  default_scope order('created_at DESC, updated_at DESC')

  validates_presence_of :name

  validates_uniqueness_of :name

  before_save :update_slug
  before_destroy do
    images = Image.where(page_id: self.id)

    images.each do |image|
      image.page_id = nil
      image.save
    end
  end

  def update_slug
   self.slug = name.parameterize
  end
end
