class ProductsController < ApplicationController
  expose(:products)
  expose(:product)

  def create
    if product.save
      redirect_to products_path, notice: "Product successfully created."
    else
      render 'new'
    end
  end

  def update
    if product.save
      redirect_to product, notice: "Product successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: "Product successfully deleted."
  end

  def add_to_cart
    unless session[:cart].is_a?(Array) 
      session[:cart] = [] 
    end

    cart = {
      name: params[:name],
      price: params[:price],
      quantity: params[:quantity]
    }

    session[:cart] << cart
    redirect_to products_path, notice: "Added to cart."
  end
end
