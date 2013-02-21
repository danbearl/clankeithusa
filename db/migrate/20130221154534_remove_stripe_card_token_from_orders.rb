class RemoveStripeCardTokenFromOrders < ActiveRecord::Migration
  def up
    change_table :orders do |t|
      t.remove :stripe_card_token
    end
  end

  def down
    change_table :orders do |t|
      t.string :stripe_card_token
    end
  end
end
