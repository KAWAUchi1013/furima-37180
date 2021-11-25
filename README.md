Users table
|Column|Type|Options|
|nickname|string |null: false|
|encrypted_password|string |null: false
|email|string|null: false|
|surname|string|null:false｜
|name|string|null:false｜
|first_name_reading|string|null:false｜
|name_reading|string|null:false｜
|birthday|date|null:false｜

#######asosieight
has_many :products
belongs_to:Buyers


Products table
|place_id|string|null: false|
|Sales period|string|null: false|
|Product_name|integer|null:false｜
|Description_of_item|text|null:false｜
|Product_price|text|null:false｜
|Product_condition|text|null:false｜
|Burden_of_shipping charges|integer|null:false｜
|Shipping_area|integer|null:false｜
|Days_to_ship|integer|null:false｜
|Category|integer|null:false｜
|User's_foreign_key|string|null:false｜

#######asosieite
has_one :buyer
belonggs_to:users

Buyers table
|Purchase goods_id|string|null:false｜
|Purchase item price|string|null:false｜
|Number of products after purchase|integer|null:false｜

#######asosieite
has_one :buyer
has_one :Products
has_many:Purchase

#######asosieite
belonggs_to:users
has_one:Buyers

Purchase table
|Postal_code|string|null:false｜
|prefectures_id|string|null:false｜
|municipalities|string|null:false｜
|address|string|null:false｜
|Building_name|string|
|telephone_number|string|null:false｜
|purch_hist_table_name|references|foreign_key: true

string  >  文字
text  > 長文
integer > 整数
date(datetime) > 日付
references > 外部キー