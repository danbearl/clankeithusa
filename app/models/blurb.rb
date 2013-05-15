class Blurb < ActiveRecord::Base
  attr_accessible :body, :front_page, :name

  has_many :blurb_associations, dependent: :destroy
  has_many :pages, through: :blurb_associations
  
end
