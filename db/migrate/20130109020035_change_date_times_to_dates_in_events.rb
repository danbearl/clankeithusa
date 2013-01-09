class ChangeDateTimesToDatesInEvents < ActiveRecord::Migration
  def up
    change_table :events do |t|
      t.remove :starts_at
      t.remove :ends_at

      t.date :starts_at
      t.date :ends_at
    end
  end

  def down
    t.remove :starts_at
    t.remove :ends_at

    t.datetime :starts_at
    t.datetime :ends_at
  end
end
