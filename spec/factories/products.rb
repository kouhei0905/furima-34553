FactoryBot.define do
  factory :product do
    productname           { 'test' }
    description           { Faker::Lorem.sentence }
    genre_id              { 2 }
    status_id             { 2 }
    burden_id             { 2 }
    d_day_id              { 2 }
    price                 { 10_000 }
    prefecture_id         { 5 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
