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
    validates :price
    validates :prefecture_id
    validates :image
  end

  validates :genre_id, numericality: { other_than: 1 }
  validates :d_day_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }

end
