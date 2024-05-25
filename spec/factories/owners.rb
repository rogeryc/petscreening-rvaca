FactoryBot.define do
  factory :owner do
    name { Faker::Name.name }
    email { Faker::PhoneNumber.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
  end
end
