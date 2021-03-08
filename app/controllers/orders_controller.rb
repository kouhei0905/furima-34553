class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_purchase_shipping, only: [:index, :create]

  def index
    @purchase_shipping = PurchaseShipping.new
    if current_user == @product.user
      redirect_to root_path
      end
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_shipping_params
    params.require(:purchase_shipping).permit( :prefecture_id, :postalcode, :municipality , :addres, :building, :phonenumber).merge(user_id: current_user.id, token: params[:token], product_id: params[:product_id])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_shipping_params[:token],
      currency: 'jpy' 
    )
  end

  def set_purchase_shipping
    @product = Product.find(params[:product_id])
  end

end
