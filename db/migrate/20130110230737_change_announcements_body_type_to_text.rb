class ChangeAnnouncementsBodyTypeToText < ActiveRecord::Migration
  def up
    change_table :announcements do |t|
      t.remove :body

      t.text :body
    end
  end

  def down
    t.remove :body

    t.string :body
  end
end
