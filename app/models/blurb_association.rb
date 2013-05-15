class BlurbAssociation < ActiveRecord::Base
  attr_accessible :blurb_id, :page_id
  belongs_to :page
  belongs_to :blurb
end
