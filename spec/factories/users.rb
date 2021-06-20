FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    full_name              { 'さくらももこ' }
    password               { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation  { password }
    gender                 { 'male' }
    birth_day              { 19_860_715 }
  end
end
