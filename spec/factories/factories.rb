FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    kind { Faker::Creature::Animal.name }
    breed { Faker::Creature::Dog.breed }
    weight { Faker::Number.decimal(l_digits: 2) }
  end
end