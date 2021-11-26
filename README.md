users_table
|column|Type|Options|
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
belong_to:buyers


products_table
|product_name|string|null:false｜
|description_of_item|text|null:false｜
|product_price|integer|null:false｜
|product_condition_id|integer|null:false｜
|burden_of_shipping_charges_id|integer|null:false｜
|shipping_area_id|integer|null:false｜
|days_to_ship_id|integer|null:false｜
|category_id|integer|null:false｜
|user|references|null:false,foreign_key|

#######association
has_one:buyer
belong_to:user

buyers_table
|user_id|integer|null:false｜foreign_key: true|
|product_id|integer|null:false｜foreign_key: true|

#######association
belong_to:product
has_one:purchase
belongs_to:buyer

purchase_table
|postal_code|string|null:false｜
|municipalities|string|null:false｜
|address|string|null:false｜
|building_name|string|
|telephone_number|string|null:false｜
|buyer_id|integer|foreign_key: true|


string  >  文字
text  > 長文
integer > 整数
date(datetime) > 日付
references > 外部キー