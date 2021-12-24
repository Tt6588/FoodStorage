FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.characters(number:250) }
  end
end