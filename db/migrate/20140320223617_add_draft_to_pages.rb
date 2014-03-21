class AddDraftToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.boolean :draft
    end
  end
end
