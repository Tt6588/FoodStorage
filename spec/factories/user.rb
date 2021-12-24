FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 8) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    after(:create) do |user|
      create_list(:group_user, 1, user: user, group: create(:group))
    end
  end
end