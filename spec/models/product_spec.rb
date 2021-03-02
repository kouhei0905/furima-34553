require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe 'ユーザー商品出品' do
    context '商品出品できるとき' do
      it 'imageとproductnameとcategory_idとstatus_idとburden_id とdays_idとpriceとprefectures_idが存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'priceが300円なら出品できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
      it 'priceが9,999,999円なら出品できる' do
        @product.price = 9999999
        expect(@product).to be_valid
      end
      it 'priceが半角なら出品できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
    end
    
    context '商品出品できないとき' do
      it 'productnameが空では登録できない' do
        @product.productname = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Productname can't be blank")
      end

      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'genre_idが空では登録できない' do
        @product.genre_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Genre can't be blank", "Genre is not a number")
      end

      it 'status_idが空では登録できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it 'burden_idが空では登録できない' do
        @product.burden_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Burden can't be blank", "Burden is not a number")
      end

      it 'd_day_idが空では登録できない' do
        @product.d_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("D day can't be blank", "D day is not a number")
      end

      it 'prefecture_idが空では登録できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it 'priceが空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数字でないと出品できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it "priceが半角英数混合では登録できないこと" do
        @product.price = "5000dollar"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英語だけでは登録できないこと" do
        @product.price = "threemillion"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
