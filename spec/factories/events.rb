FactoryBot.define do
  factory :event do
    event_name    {'東京マラソン'}
    event_date    {Faker::Date.between(from: '2021-06-26', to: '2021-12-31')}
    start_time    {Faker::Time.between(from: '00:00:00', to: '23:59:59')}
    finish_time   {Faker::Time.between(from: '00:00:00', to: '23:59:59' )}
    deadline      {Faker::Date.between(from: '2021-06-26', to: '2021-12-31')}
    description   {Faker::Lorem.sentence}
    fee           {1000}
    category_id   {2}
    prefecture_id {2}
    place_number  {'東京都品川区'}
    place_name    {'日比谷公園'}

    association :user

    after(:build) do |event|
      event.image.attach(io: File.open("public/images/test_image.png"), filename: 'test_image.png')
    end
  end
end
