class Order < ActiveRecord::Base
  attr_accessible :address_city, :address_state, :address_street_1, :address_street_2, :address_zip, :customer_first_name, :customer_last_name, :email, :notes, :processed, :products, :shipped, :stripe_card_token
end
