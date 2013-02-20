require 'spec_helper.rb'

describe Cart do
  it "consolidates its contents" do
    cart = [{name: "hat", color: "green", size: "m", quantity: 5}, {name: "hat", color: "green", size: "m", quantity: 1}]
    
    cart = Cart.consolodate(cart)

    cart[1][:quantity].should eq(6)
    cart.length.should eq(1)
  end
end
