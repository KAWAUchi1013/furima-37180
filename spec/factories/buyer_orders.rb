FactoryBot.define do
  factory :buyer_order do
    postal_code{ '193-0003' }
    municipalities{ 'ホゲ町' }
    address{ '北海道' }
    building_name{ 'コーポホゲ' }
    telephone_number{ '0809998888' }
    buyer{ 'タロウ' }
    shipping_area_id{ '1' }
    token{'aaaaaaaa'}
  end
end
