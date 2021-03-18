require 'rails_helper'

RSpec.describe ShippingAddressPurchase, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @shipping_address_purchase = FactoryBot.build(:shipping_address_purchase, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '商品購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@shipping_address_purchase).to be_valid
      end
      it 'priceとtokenがあれば保存ができる' do
        expect(@shipping_address_purchase).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @shipping_address_purchase.building_name = ''
        expect(@shipping_address_purchase).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it 'post_codeが空だと保存できない' do
        @shipping_address_purchase.post_code = ''
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @shipping_address_purchase.post_code = '1111111'
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include('Post code is invalid')
      end
      it 'shipping_area_idを選択していないと保存できない' do
        @shipping_address_purchase.shipping_area_id = ''
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが1の場合登録できない' do
        @shipping_address_purchase.shipping_area_id = 1
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'municipalityが空だと保存できない' do
        @shipping_address_purchase.municipality = ''
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できない' do
        @shipping_address_purchase.address = ''
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @shipping_address_purchase.phone_number = ''
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上だと保存できない' do
        @shipping_address_purchase.phone_number = '111111111111'
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが全角数字だと保存できない' do
        @shipping_address_purchase.phone_number = '１１１１１１１１１１'
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角数字以外だと保存できない' do
        @shipping_address_purchase.phone_number = '１１１１１aaaaa'
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @shipping_address_purchase.token = nil
        @shipping_address_purchase.valid?
        expect(@shipping_address_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
