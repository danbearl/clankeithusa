require 'spec_helper'

describe Cart do
  describe '#subtotal' do
    cart = [{name: "hat", color: "green", size: "m", quantity: 5, price: '5'}, {name: "hat", color: "green", size: "m", quantity: 1, price: '5'}]

    it 'calculates its subtotal' do
      Cart.subtotal(cart).should eq(30)
    end
  end

end
