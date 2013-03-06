class RemoveFrontPageFromAnnouncements < ActiveRecord::Migration

  def change
    change_table :announcements do |t|
      t.remove :front_page
    end
  end
end
