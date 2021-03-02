class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :firstname
      validates :lastname
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :kana_firstname
      validates :kana_lastname
    end

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
      validates :password
    end
  end
end
