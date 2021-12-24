FactoryBot.define do
  factory :group do
    name { Faker::Lorem.characters(number: 5) }
  end
end