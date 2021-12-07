require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe "新規商品が出品ができる" do
      context  "正常系"  do
        it"新規商品が出品ができる" do
           expect(@item).to be_valid
        end
      end

      context  "異常系"  do
       it"商品画像を1枚つけることが必須であること" do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include "Image can't be blank"
       end
        it "カテゴリーの情報が必須であること" do
          @item.category_id= ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it "商品の状態の情報が必須であること" do
          @item.product_condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Product condition can't be blank"
        end
        it"配送料の負担の情報が必須であること" do
          @item.burden_of_shipping_charge_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
        end
        it "発送元の地域の情報が必須であること" do
          @item.shipping_area_id= ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping area can't be blank"
        end
        it "発送までの日数の情報が必須であること" do
          @item.days_to_ship_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Days to ship can't be blank"
        end
        it "価格の情報が必須であること" do
          @item.product_price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Product price can't be blank"
        end
      end
    end
end  