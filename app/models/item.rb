class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :estimated_shipping
  belongs_to :shipping_area
  belongs_to :shipping_fee

  with_options presence: true do
  validates :name
  validates :content
  validates :category_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :estimated_shipping_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: "is invalid"}
  validates :image
  end
end