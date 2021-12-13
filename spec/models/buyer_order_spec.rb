require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @buyer_order = FactoryBot.build(:buyer_order, user_id: user.id,item_id: item.id)
    end
  describe 'ユーザー新規登録' do
    context '正常系' do
      it 'ユーザー新規登録ができる' do
        expect(@buyer_order).to be_valid
      end
    end
    context '異常系' do
      it '配送先の住所情報も購入の都度入力させること' do
        @buyer_order.address = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Address can't be blank"
      end
      it '郵便番号が必須であること' do
        @buyer_order.postal_code = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @buyer_order.postal_code = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県が必須であること。' do
        @buyer_order.shipping_area_id = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '市区町村が必須であること' do
        @buyer_order.municipalities = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Municipalities can't be blank"
      end
      it '番地が必須であること' do
        @buyer_order.postal_code = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Postal code can't be blank"
      end
      it '建物名は任意であること' do
        @buyer_order.building_name = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Building name can't be blank"
      end
      it '電話番号が必須であること' do
        @buyer_order.telephone_number = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Telephone number can't be blank"
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @buyer_order.telephone_number = '000000000000'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Telephone number is invalid"
      end
    end
  end
end

