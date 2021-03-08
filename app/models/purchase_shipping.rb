class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :prefecture_id, :postalcode, :municipality, :addres, :building, :phonenumber ,:token
  #  :product_id, token

  with_options presence: true do
    validates :prefecture_id 
    validates :postalcode
    validates :addres 
    validates :building
    validates :phonenumber
    validates :token
  end

  def save
    # 購入情報を保存し、 parchase変数に代入する
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    Shipping.create(prefecture_id: prefecture_id, postalcode: postalcode, municipality: municipality, addres: addres, building: building, phonenumber: phonenumber, purchase_id: purchase.id)
  end

end