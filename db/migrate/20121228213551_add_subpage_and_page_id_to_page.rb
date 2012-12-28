class AddSubpageAndPageIdToPage < ActiveRecord::Migration
  def up
    change_table :pages do |t|
      t.remove :section_id

      t.integer :parent_id
    end
  end

  def down
    change_table :pages do |t|
      t.remove :parent_id

      t.integer :section_id
    end
  end
end
