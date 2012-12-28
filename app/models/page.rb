class Page < ActiveRecord::Base

  has_many :sub_pages, class_name: "Page",
    foreign_key: "parent_id"
  belongs_to :parent, class_name: "Page"

  has_many :galleries
  
  attr_accessible :body, :name, :slug

  default_scope order('created_at DESC, updated_at DESC')

  validates_uniqueness_of :name

  before_save :update_slug

  def update_slug
   self.slug = name.parameterize
  end

end
