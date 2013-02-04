class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :colors
      t.string :sizes
      t.string :image

      t.timestamps
    end
  end
end
