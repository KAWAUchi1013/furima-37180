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
          @item.category_id= nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it "商品の状態の情報が必須であること" do
          @item.product_condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Product condition can't be blank"
        end
        it"配送料の負担の情報が必須であること" do
          @item.burden_of_shipping_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
        end
        it "発送元の地域の情報が必須であること" do
          @item.shipping_area_id= nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping area can't be blank"
        end
        it "発送までの日数の情報が必須であること" do
          @item.days_to_ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Days to ship can't be blank"
        end
        it "価格の情報が必須であること" do
          @item.product_price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Product price can't be blank"
        end
        it "カテゴリーに「---」が選択されている場合は出品できない" do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include "Category must be other than 0"
        end
        it "商品の状態に「---」が選択されている場合は出品できない" do
          @item.product_condition_id  = 0
          @item.valid?
          expect(@item.errors.full_messages).to include "Product condition must be other than 0"
        end
        it "配送料の負担に「---」が選択されている場合は出品できない" do
          @item.burden_of_shipping_charge_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include "Burden of shipping charge must be other than 0"
        end
        it "発送元の地域に「---」が選択されている場合は出品できない" do
          @item.shipping_area_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping area must be other than 0"
        end
        it "発送までの日数に「---」が選択されている場合は出品できない" do
          @item.days_to_ship_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include "Days to ship must be other than 0"
        end
        it "userが紐付いていなければ出品できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "User must exist"
        end
        it "300円を超えていなければ出品できない" do
          @item.product_price = 0
          @item.valid?
          expect(@item.errors.full_messages).to include "Product price must be greater than or equal to 300"
        end
        it "9999999円を超えていると出品できない" do
          @item.product_price = 9999999999999
          @item.valid?
          expect(@item.errors.full_messages).to include "Product price must be less than or equal to 9999999"
        end
        it "商品名が空では保存できない" do
          @item.product_name= nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Product name can't be blank"
        end
        it "商品説明が空では保存できない" do
          @item.description_of_item = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Description of item can't be blank"
        end
        it "金額が半角数字でなければ保存できない" do
          @item.product_price = "あいうえお"
          @item.valid?
          expect(@item.errors.full_messages).to include "Product price is not a number"
        end
      end
    end
end  