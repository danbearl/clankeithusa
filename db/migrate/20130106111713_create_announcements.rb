class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :name
      t.string :body
      t.boolean :front_page
      t.boolean :site_wide

      t.timestamps
    end
  end
end
