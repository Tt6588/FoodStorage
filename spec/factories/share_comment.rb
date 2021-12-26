FactoryBot.define do
  factory :share_comment do
    comment { Faker::Lorem.characters(number:250) }
  end
end