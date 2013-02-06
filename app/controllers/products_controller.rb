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
end
