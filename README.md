User table
|Column|Type|Options|
|id|string |null: false|
|nickname|string |null: false|
|passward|string |null: false
|Mail address|integer|null: false|

Product table
|image.id|string|null: false|
|place.id|string|null: false|
|Sales period|string|null: false|
｜Purchase record｜text|null: false|

Buyer table
|Purchase goods_id|string|null:false｜
|Purchased item price|string|null:false｜
|Number of products after purchase|integer|null:false｜

Purchase address
|Purchase address|string|null:false｜
|Shipping address|string|null:false｜
|Seller's address|string|null:false｜

string  >  文字
text  > 長文
integer > 整数
date(datetime) > 日付
references > 外部キー