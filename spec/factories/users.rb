FactoryBot.define do
  factory :user do
    name { 'タナカ' }
    email { Faker::Internet.free_email }
    password { '1A23B56C' }
    password_confirmation { password }
    first_name_reading { 'カタカナ' }
    name_reading { 'ヨミカタ' }
    birthday { '1930-3-3' }
    nickname { 'タナカ' }
    surname { 'タナカ' }
  end
end
