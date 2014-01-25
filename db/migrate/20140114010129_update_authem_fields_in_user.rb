class UpdateAuthemFieldsInUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.column :password_digest, :string
      t.column :remember_token, :string
      t.column :reset_password_token, :string
      t.column :session_token, :string

      t.remove :salt
      t.remove :crypted_password
    end
  end
end
