FactoryBot.define do
  factory :purchase_shipping do
    token      { 'aafjkfllllls' }
    postalcode { '123-4567' }
    prefecture_id { 2 }
    municipality { 'テスト市' }
    addres { '1-1' }
    building { '東京ハイツ' }
    phonenumber { '09012345678' }
    user_id     {1}
    product_id  {1}
  end
end
