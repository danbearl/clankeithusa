class ChangeImageableIdToPageIdInImages < ActiveRecord::Migration
  def up
    change_table :images do |t|
      t.remove :imageable_id
      t.remove :imageable_type

      t.integer :page_id
    end
  end

  def down
    t.remove :page_id

    t.integer :imageable_id
    t.string :imageable_type
  end
end
