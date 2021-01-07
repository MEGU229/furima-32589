FactoryBot.define do

  factory :form do
  
    post_code                 {'123-4567'}
    prefecture_id             {Faker::Number.between(from: 2, to: 48)}
    city                      {'練馬区'}
    house_number              {'1-1-1'}
    building_name                {'11'}
    tel                       {'01234567890'}
    token                     {"tok_abcdefghijk00000000000000000"}
  end
end