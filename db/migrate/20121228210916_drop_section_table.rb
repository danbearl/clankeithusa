class DropSectionTable < ActiveRecord::Migration
  def up
    drop_table :sections
  end

  def down
    create_table :sections do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
