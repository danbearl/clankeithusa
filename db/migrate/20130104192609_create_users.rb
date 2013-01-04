class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :salt
      t.string :crypted_password
      t.string :name
      t.boolean :admin

      t.timestamps
    end
  end
end
