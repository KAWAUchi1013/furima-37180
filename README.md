Users table
|Column|Type|Options|
|nickname|string |null: false|
|encrypted_password|string |null: false
|email|integer|null: false|
|Surname|string|null:false｜
|name|string|null:false｜
|First name reading (phonetic)|string|null:false｜
|Name reading (phonetic)|string|null:false｜
|Birthday|string|null:false｜

#######asosieight
has_many Products table


Products table
|place_id|string|null: false|
|Sales period|string|null: false|
|Product name|string|null:false｜
|Description of item|text|null:false｜
|Product price|text|null:false｜
|Product condition|text|null:false｜
|Burden of shipping charges|string|null:false｜
|Shipping area|string|null:false｜
|Days to ship|integer|null:false｜
|Category|string|null:false｜
|User's foreign key|string|null:false｜

#######asosieite
has_one Buyers table

Buyers table
|Purchase goods_id|string|null:false｜
|Purchase item price|string|null:false｜
|Number of products after purchase|integer|null:false｜

#######asosieite
has_one Buyers table

Purchase table
|Purchase address|string|null:false｜
|Shipping address|string|null:false｜
|Seller's address|string|null:false｜
|Postal code|string|null:false｜
|prefectures|string|null:false｜
|municipalities|string|null:false｜
|address|string|null:false｜
|Building name|string|null:false｜
|telephone number|string|null:false｜
|Foreign key in the purchase management table|string|null:false｜

string  >  文字
text  > 長文
integer > 整数
date(datetime) > 日付
references > 外部キー