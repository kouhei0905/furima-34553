class OrdersController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new
  end
end
