class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    redirect_to action: :index unless @product.user_id == current_user.id
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:productname, :description, :genre_id, :status_id, :burden_id, :d_day_id, :price, :image,
                                    :prefecture_id).merge(user_id: current_user.id)
  end
end
