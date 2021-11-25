users_table
|Column|Type|Options|
|nickname|string |null: false|
|encrypted_password|string |null: false|
|email|string|null: false|unique: true|
|surname|string|null:false｜
|name|string|null:false｜
|first_name_reading|string|null:false｜
|name_reading|string|null:false｜
|birthday|date|null:false｜

#######association
has_many :products
has_one:Buyers


products_table
|Product_name|string|null:false｜
|Description_of_item|text|null:false｜
|Product_price|integer|null:false｜
|Product_condition_id|integer|null:false｜
|Burden_of_shipping_charges_id|integer|null:false｜
|Shipping_area_id|integer|null:false｜
|Days_to_ship_id|integer|null:false｜
|Category_id|integer|null:false｜
|User's_foreign_key|string|null:false｜

#######association
has_one:buyer
belongs_to:user

buyers_table
|purchase_goods_id|integer|null:false｜
|purchase_item_price_id|integer|null:false｜
|number_of_products_after_purchase_id|integer|null:false｜

#######association
belongs_to:Products
has_one:purchase

#######association
has_one:buyer

Purchase_table
|Postal_code|string|null:false｜
|prefectures_id|string|null:false｜
|municipalities|string|null:false｜
|address|string|null:false｜
|Building_name|string|
|telephone_number|string|null:false｜


string  >  文字
text  > 長文
integer > 整数
date(datetime) > 日付
references > 外部キー