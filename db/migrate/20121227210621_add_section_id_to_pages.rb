class AddSectionIdToPages < ActiveRecord::Migration
  def up
    change_table :pages do |t|
      t.integer :section_id
    end
  end

  def down
    change_table :pages do |t|
      t.remove :section_id
    end
  end
end
