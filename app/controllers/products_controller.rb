class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :set_index, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.order(created_at: :DESC)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:productname, :description, :genre_id, :status_id, :burden_id, :d_day_id, :price, :image,
                                    :prefecture_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_index
    redirect_to action: :index unless @product.user_id == current_user.id
  end
end
