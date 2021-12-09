FactoryBot.define do
  factory :item do
    product_name { 'パソコン' }
    description_of_item { '壊れているパソコン' }
    product_price { '12345' }
    product_condition_id { '3' }
    burden_of_shipping_charge_id { '3' }
    shipping_area_id { '35' }
    days_to_ship_id { '4' }
    category_id { '3' }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/shutterstock_1005938026.jpeg'), filename: 'shutterstock_1005938026.jpeg')
    end
  end
end
