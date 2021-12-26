FactoryBot.define do
  factory :share_food do
    food_name { Faker::Lorem.characters(number:5) }
    detail { Faker::Lorem.characters(number:250) }
    genre { Faker::Lorem.characters(number:5) }
    quantity {5}
    deadline_time {'2021/12/28'}
  end
end