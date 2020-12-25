FactoryBot.define do

  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon-precomposed.png'), filename: 'apple-touch-icon-precomposed.png')
    end

    name                     {Faker::Name.name}
    text                     {Faker::Lorem.sentences}
    price                    {Faker::Number.between(from: 300, to: 9999999)}
    category_id              {Faker::Number.between(from: 2, to: 11)}
    condition_id             {Faker::Number.between(from: 2, to: 7)}
    shipping_cost_id         {Faker::Number.between(from: 2, to: 3)}
    prefecture_id            {Faker::Number.between(from: 2, to: 48)}
    days_to_ship_id          {Faker::Number.between(from: 2, to: 4)}
    

    association :user

  end
end