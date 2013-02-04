require 'spec_helper.rb'

describe Order do

  it "has accessible attributes" do
    order = Fabricate(:order)

    order.email.should eq("customer@example.com")
    order.customer_first_name.should eq("Dan")
    order.customer_last_name.should eq("Bearl")
    order.address_street_1.should eq("12345 Some Street")
    order.address_street_2.should eq("Apt. 2")
    order.address_city.should eq("Jacksonville")
    order.address_state.should eq("FL")
    order.address_zip.should eq("12345")
    order.processed.should eq(true)
    order.notes.should eq("Draw a picture on the package.")
    order.products.should eq("hat@product,5.99@price,green@color,1@qty&shirt@product,15.99@price,red@color,xl@size")
    order.shipped.should eq(false)
    order.stripe_card_token.should eq("12345")
  end

  it "calculates its subtotal" do
    order = Fabricate(:order)

    order.subtotal.should eq(21.98)
  end

  it "calculates its shipping" do
    order = Fabricate(:order)

    order.shipping.should eq(5.95)
  end

  it "calculates its total" do
    order = Fabricate(:order)

    order.total.should eq(27.93)
  end

  it "packs items hash into a string" do
    order = Fabricate(:order)

    Order.pack_products([{product: "hat", price: 5.99, color: "green", qty: 1},{product: "shirt", price: 15.99, color: "red", size: "xl"}]).should eq("hat@product,5.99@price,green@color,1@qty&shirt@product,15.99@price,red@color,xl@size")
  end

  it "unpacks items string into hash" do
    order = Fabricate(:order)

    Order.unpack_products(order.products).should eq([{product: "hat", price: "5.99", color: "green", qty: "1"},{product: "shirt", price: "15.99", color: "red", size: "xl"}])
  end
end
