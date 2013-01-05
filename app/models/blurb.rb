class Blurb < ActiveRecord::Base
  attr_accessible :body, :front_page, :name, :page_id

  belongs_to :page
end
