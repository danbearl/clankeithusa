class Document < ActiveRecord::Base
  attr_accessible :name, :description, :file, :page_id

  belongs_to :page

  mount_uploader :file, DocumentUploader

  def owner
    unless self.page_id.nil_or_zero?
      Page.find(self.page_id).name
    else
      "None"
    end
  end
end
