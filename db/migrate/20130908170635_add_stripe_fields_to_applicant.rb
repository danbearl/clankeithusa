class AddStripeFieldsToApplicant < ActiveRecord::Migration
  def change
    change_table :applicants do |t|
      t.integer :subtotal
      t.integer :shipping
      t.string :stripe_payment_token
    end
  end
end
