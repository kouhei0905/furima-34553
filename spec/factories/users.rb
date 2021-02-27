FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a000000'}
    password_confirmation {password}
    firstname             {'山田'}
    lastname              {'太郎'}
    kana_firstname        {'ヤマダ'}
    kana_lastname         {'タロウ'}
    birthday              {'1999-03-03'}
  end
end