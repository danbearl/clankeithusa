class Document < ActiveRecord::Base
  attr_accessible :name, :description, :file, :page_id

  belongs_to :page

  mount_uploader :file, DocumentUploader
end
