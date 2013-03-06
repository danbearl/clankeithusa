require 'spec_helper'

describe Order do
  
  order = Fabricate(:order)

  describe "#subtotal" do
    it "calculates its subtotal" do
      order.subtotal.should eq(21.98)

    end
  end

  describe "#shipping" do
    it "calculates its shipping" do
      order.shipping.should eq(5.95)

    end
  end

  describe "#total" do
    it "calculates its total" do
      order.total.should eq(27.93)

    end
  end

  describe "#pack_products" do
    it "packs items hash into a string" do

      Order.pack_products([{product: "hat", price: 5.99, color: "green", quantity: 1},{product: "shirt", price: 15.99, color: "red", size: "xl", quantity: "1"}]).should eq("hat@product,5.99@price,green@color,1@quantity&shirt@product,15.99@price,red@color,xl@size,1@quantity")

    end
  end

  describe "#unpack_products" do
    it "unpacks items string into hash" do

      Order.unpack_products(order.products).should eq([{product: "hat", price: "5.99", color: "green", quantity: "1"},{product: "shirt", price: "15.99", color: "red", size: "xl", quantity: "1"}])

    end
  end
end
