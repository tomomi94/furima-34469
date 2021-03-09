class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :product_condition_id
  belongs_to :estimated_shipping_id
  belongs_to :shipping_area_id
  belongs_to :shipping_fee_id


end
