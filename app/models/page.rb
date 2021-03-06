class Page < ActiveRecord::Base

  has_many :sub_pages, class_name: "Page",
    foreign_key: "parent_id"
  belongs_to :parent, class_name: "Page"
  has_many :images
  has_many :blurb_associations, dependent: :destroy
  has_many :blurbs, through: :blurb_associations
  has_many :documents
  has_paper_trail
  
  accepts_nested_attributes_for :blurb_associations, reject_if: lambda { |a| a[:blurb_id].blank? }, allow_destroy: true

  attr_accessible :body, :name, :slug, :parent_id, :public, :priority, :category, :blurb_associations_attributes, :draft

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

  def breadcrumbs(first = true)
    if first
      return Page.find(parent_id).breadcrumbs(false)
    end

    if !self.parent_id.nil_or_zero?
      return Page.find(parent_id).breadcrumbs(false) + %Q{<li><a href="/#{self.slug}">#{self.name}</a><span class="divider">/</span></li>}
    end

    return %Q{<li><a href="/#{self.slug}">#{self.name}</a><span class="divider">/</span></li>}

  end
end
