FactoryBot.define do
  factory :item do
    product_name{"パソコン"}
    description_of_item{"壊れているパソコン"}
    product_price{"12345"}
    product_condition_id{"状態悪い"}
    burden_of_shipping_charge_id{"出品者"}
    shipping_area_id{"沖縄県"}
    days_to_ship_id{"4日"}
    category_id{"電子機器"}
    user{"タナカ"}
  end
end
