class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :picture
      t.integer :imageable_id
      t.string :imageable_type
      t.integer :priority
      t.text :description

      t.timestamps
    end
  end
end
