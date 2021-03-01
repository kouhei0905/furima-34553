class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end


  private
  def product_params
    params.require(:product).permit(:productname, :description, :category_id, :status_id, :burden_id, :days_id, :price, :image ).merge(user_id: current_user.id)
  end

end

