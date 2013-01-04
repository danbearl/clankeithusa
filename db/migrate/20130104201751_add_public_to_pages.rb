class AddPublicToPages < ActiveRecord::Migration
  def up
    change_table :pages do |t|
      t.boolean :public
    end
  end

  def down
    change_table :pages do |t|
      t.remove :public
    end
  end
end
