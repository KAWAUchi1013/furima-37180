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
|user|references|null:false,foreign_key|

#######association
has_one:buyer
belong_to:user

buyers_table
|user|integer|null:false｜foreign_key|
|product|integer|null:false｜primary_key|

#######association
belong_to:Product
has_one:purchase

Purchase_table
|Postal_code|string|null:false｜
|prefectures_id|integer|null:false｜
|municipalities|string|null:false｜
|address|string|null:false｜
|Building_name|string|
|telephone_number|string|null:false｜
|buyer|integer|foreign_key|


string  >  文字
text  > 長文
integer > 整数
date(datetime) > 日付
references > 外部キー