FactoryBot.define do
  factory :tweet do
    text { Faker::Lorem.sentence }
    association :user

    after(:build) do |tweet|
      tweet.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
