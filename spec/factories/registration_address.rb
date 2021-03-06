FactoryBot.define do
  factory :registration_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { '東京都' }
    place_number  { '1-1' }
    building_name { '東京ハイツ' }
    phone_number  { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
