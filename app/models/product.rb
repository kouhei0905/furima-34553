class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :d_day

  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :productname
    validates :description
    validates :genre_id
    validates :status_id
    validates :burden_id
    validates :d_day_id
    validates :prefecture_id
    validates :image
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :d_day_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
  end

  validates :price, numericality: true
end
