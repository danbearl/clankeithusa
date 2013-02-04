Fabricator(:order) do
  email "customer@example.com"
  customer_first_name "Dan"
  customer_last_name "Bearl"
  address_street_1 "12345 Some Street"
  address_street_2 "Apt. 2"
  address_city "Jacksonville"
  address_state "FL"
  address_zip "12345"
  processed true
  notes "Draw a picture on the package."
  products "hat@product,5.99@price,green@color,1@qty&shirt@product,15.99@price,red@color,xl@size"
  shipped false
  stripe_card_token "12345"
end
