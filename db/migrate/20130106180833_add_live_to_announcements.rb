class AddLiveToAnnouncements < ActiveRecord::Migration
  def up
    change_table :announcements do |t|
      t.boolean :live
    end
  end

  def down
    change_table :announcements do |t|
      t.remove :live
    end
  end
end
