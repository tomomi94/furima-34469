FactoryBot.define do
  factory :shipping_address_purchase do
    post_code { '123-4567' }
    shipping_area_id { 8 }
    municipality { '札幌市中央区' }
    address { '旭ヶ丘2-2' }
    building_name { '札幌ハイツ' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
