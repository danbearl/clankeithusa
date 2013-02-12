class CartController < ApplicationController

  expose(:subtotal) {Cart.subtotal(session[:cart]).to_f}
  expose(:shipping) {Order.calc_shipping(subtotal).to_f}

  def empty_cart
    session[:cart] = []
    redirect_to "/cart/", notice: "Cart emptied!"
  end
end
