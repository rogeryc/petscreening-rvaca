# frozen_string_literal: true

FactoryBot.define do
  factory :breed_info do
    name { 'MyString' }
    description { 'MyText' }
    min_life { 1 }
    max_life { 1 }
    hypoallergenic { false }
  end
end
