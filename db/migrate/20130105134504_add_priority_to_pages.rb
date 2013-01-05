class AddPriorityToPages < ActiveRecord::Migration
  def up
    change_table :pages do |t|
      t.integer :priority
    end
  end

  def down
    change_table :pages do |t|
      t.remove :priority
    end
  end
end
