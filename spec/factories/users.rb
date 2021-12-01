FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name_reading{"カタカナ"}
    name_reading{"ヨミカタ"}
    birthday{"1930-3-3"}
    nickname{"タナカ"}
    surname{"タナカ"}
end
end