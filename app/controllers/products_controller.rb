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

    item = {
      name: params[:name],
      price: params[:price],
      quantity: params[:quantity].to_i,
      color: params[:color],
      size: params[:size]
    }

    consolidated = false

    session[:cart].each_with_index do |cart_item, i|
      if cart_item[:name] == item[:name] and cart_item[:color] == item[:color] and cart_item[:size] == item[:size]
        session[:cart][i][:quantity] += item[:quantity]
        consolidated = true
      end 
    end

    if consolidated == false
      session[:cart] << item
    end

    redirect_to products_path, notice: "Added to cart."
  end
end
