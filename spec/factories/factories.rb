FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    kind { Faker::Creature::Animal.name }
    breed { Faker::Creature::Dog.breed }
  end
end