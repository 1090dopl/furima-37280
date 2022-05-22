FactoryBot.define do
  factory :item do
    association :user
    
    explanation {Faker::Lorem.sentence}
    name { Faker::Name.name }
    category_id { Faker::Number.between(from: 1, to: 10) }
    item_status_id { Faker::Number.between(from: 1, to: 6) }
    charge_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')


    end 
  end
end  
 
