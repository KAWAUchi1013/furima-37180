require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品が出品ができる' do
    context '正常系' do
      it '新規商品が出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Imageを入力してください"
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Categoryを入力してください", "Categoryを入力してください", "Categoryは数値で入力してください"
      end
      it '商品の状態の情報が必須であること' do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product conditionを入力してください", "Product conditionを入力してください", "Product conditionは数値で入力してください"
      end
      it '配送料の負担の情報が必須であること' do
        @item.burden_of_shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping chargeを入力してください", "Burden of shipping chargeを入力してください", "Burden of shipping chargeは数値で入力してください"
      end
      it '発送元の地域の情報が必須であること' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping areaを入力してください", "Shipping areaを入力してください", "Shipping areaは数値で入力してください"
      end
      it '発送までの日数の情報が必須であること' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to shipを入力してください", "Days to shipを入力してください", "Days to shipは数値で入力してください"
      end
      it '価格の情報が必須であること' do
        @item.product_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product priceを入力してください", "Product priceは数値で入力してください"
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Categoryは0以外の値にしてください"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.product_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Product conditionは0以外の値にしてください"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.burden_of_shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping chargeは0以外の値にしてください"
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping areaは0以外の値にしてください"
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to shipは0以外の値にしてください"
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Userを入力してください"
      end
      it '300円を超えていなければ出品できない' do
        @item.product_price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Product priceは300以上の値にしてください"
      end
      it '9999999円を超えていると出品できない' do
        @item.product_price = 9_999_999_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include "Product priceは9999999以下の値にしてください"
      end
      it '商品名が空では保存できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product nameを入力してください"
      end
      it '商品説明が空では保存できない' do
        @item.description_of_item = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description of itemを入力してください"
      end
      it '金額が半角数字でなければ保存できない' do
        @item.product_price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include "Product priceは数値で入力してください"
      end
    end
  end
end
