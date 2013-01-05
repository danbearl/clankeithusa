class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
      t.string :name
      t.text :body
      t.integer :page_id
      t.boolean :front_page

      t.timestamps
    end
  end
end
