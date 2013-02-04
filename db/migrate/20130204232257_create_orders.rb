class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :address_street_1
      t.string :address_street_2
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.boolean :processed
      t.boolean :shipped
      t.text :notes
      t.text :products
      t.string :stripe_card_token

      t.timestamps
    end
  end
end
