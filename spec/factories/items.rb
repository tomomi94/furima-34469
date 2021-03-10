FactoryBot.define do
  factory :item do
    name                  {"CD"}
    content               {"10-FEETのCD"}
    category_id           {"6"}
    product_condition_id  {"2"}
    estimated_shipping_id {"2"}
    shipping_area_id      {"40"}
    shipping_fee_id       {"2"}
    price                 {"300"}
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
