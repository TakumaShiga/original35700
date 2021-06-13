FactoryBot.define do
  factory :answer do
    message {Faker::Lorem.sentence[1..500]}
    association :question
    association :user
  end
end
