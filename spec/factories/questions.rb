FactoryBot.define do
  factory :question do
    title {Faker::Lorem.sentence[1..100]}
    post  {Faker::Lorem.sentence[1..600]}
    association :user
  end
end
