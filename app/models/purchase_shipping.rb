class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :prefecture_id, :postalcode, :municipality, :addres, :building, :phonenumber ,:token
  #  :product_id, token

  with_options presence: true do
    validates :prefecture_id 
    validates :addres 
    validates :building
    validates :token
    validates :municipality

    with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    end

    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postalcode
    end

    with_options format: { with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/ } do
    validates :phonenumber
    end
  end

  def save
    # 購入情報を保存し、 parchase変数に代入する
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    Shipping.create(prefecture_id: prefecture_id, postalcode: postalcode, municipality: municipality, addres: addres, building: building, phonenumber: phonenumber, purchase_id: purchase.id)
  end

end