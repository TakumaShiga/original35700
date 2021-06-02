FactoryBot.define do
  factroy :user do
    nickname        {Faker::Name.name}
    email           {Faker::Internet.free_email}
    password        {Faker::Internet.pass}