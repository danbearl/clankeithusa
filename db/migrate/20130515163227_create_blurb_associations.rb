class CreateBlurbAssociations < ActiveRecord::Migration
  def change
    create_table :blurb_associations do |t|
      t.integer :page_id
      t.integer :blurb_id

      t.timestamps
    end
  end
end
