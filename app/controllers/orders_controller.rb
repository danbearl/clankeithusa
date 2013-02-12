class OrdersController < ApplicationController
  expose(:orders)
  expose(:order)
  expose(:order_items) {Order.unpack_products(order.products)}

  def create
    @order = Order.new(params[:order])

    @order.products = Order.pack_products(session[:cart])

    if @order.save_with_payment
      session[:cart] = []
      redirect_to root_path, notice: "Thank you for your order!"
    else
      redirect_to "/cart/", notice: "Some error prevented processing of your order."
    end
  end

  def update
    if order.save
      redirect_to orders_path, notice: "Order successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    order.destroy
    redirect_to :root, notice: "Order successfully deleted."
  end

end
