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
|Product_name|string|null:false｜
|Description_of_item|text|null:false｜
|Product_price|integer|null:false｜
|Product_condition_id|integer|null:false｜
|Burden_of_shipping charges_id|integer|null:false｜
|Shipping_area_id|integer|null:false｜
|Days_to_ship_id|integer|null:false｜
|Category_id|integer|null:false｜
|User's_foreign_key|string|null:false｜

#######asosieite
has_one :buyer
belongs_to:user

buyers table
|Purchase goods_id|integer|null:false｜
|Purchase item price|integer|null:false｜
|Number of products after purchase|integer|null:false｜

#######asosieite
has_one :buyer
has_one :Products
has_one:Purchase

#######asosieite
has_one:buyer

Purchase table
|Postal_code|string|null:false｜
|prefectures_id|integer|null:false｜
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