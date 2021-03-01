class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  has_one_attached :image


  with_options presence: true do
    validates :productname
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :days_id
    validates :price 
end
