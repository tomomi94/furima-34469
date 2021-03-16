class ShippingAddressPurchas
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase

  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
   validates :shipping_area_id, numericality: { other_than: 1 }
   validates :municipality
   validates :address
   validates :phone_number, format: { with: ^\d{,11}$ }
   validates :purchase_id
  end

  def save
    shipping_address = ShippingAddress.create(item_id: item_id, user_id: user_id)
    purchas = Purchas.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, phone_number: phone_number, purchase_id: purchase_id)
  end
end