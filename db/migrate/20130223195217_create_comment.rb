class CreateComment < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.text :body
      t.string :author
      t.boolean :approved

      t.timestamps
    end
  end
end
