require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '住所情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id)
    end
    context '商品購入できるとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping).to be_valid
    end

    it 'buildingが抜けていても登録できること' do
      @purchase_shipping.building = ''
      expect(@purchase_shipping).to be_valid
    end

    end
    context '商品購入できない時' do
    it 'postalcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping.postalcode = '1234567'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Postalcode is invalid')
    end

    it 'postalcodeが空だと保存できないこと' do
      @purchase_shipping.postalcode = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postalcode can't be blank", 'Postalcode is invalid')
    end

    it 'prefecture_idを選択していないと保存できないこと' do
      @purchase_shipping.prefecture_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'municipalityが空だと保存できないこと' do
      @purchase_shipping.municipality = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addresが空だと保存できないこと' do
      @purchase_shipping.addres = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Addres can't be blank")
    end
    it 'phonenumberが空だと保存できないこと' do
      @purchase_shipping.phonenumber = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phonenumber can't be blank")
    end
    it 'phonenumberが12桁だと保存できないこと' do
      @purchase_shipping.phonenumber = '123456789101'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phonenumber is invalid')
    end
    it 'user_idが空だと保存できないこと' do
      @purchase_shipping.user_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end

    it 'product_idが空だと保存できないこと' do
      @purchase_shipping.product_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Product can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @purchase_shipping.token = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
    end
  end
end
