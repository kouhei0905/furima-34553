class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :user_id, :product_id, :prefecture_id, :postalcode, :municipality, :addres, :building, :phonenumber, :purchase

  with_options presence: true do
    validates :prefecture_id 
    validates :postalcode
    validates :addres 
    validates :building
    validates :phonenumber
  end

  def save
    # 購入情報を保存し、 parchase変数に代入する
    parchase = Parchase.create(user_id: user_id, product_id: product_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    Address.create(prefecture_id: prefecture_id, postalcode: postalcode, municipality: municipality, addres: addres, building: building, phonenumber: phonenumber, purchase_id: purchase.id)
  end

end