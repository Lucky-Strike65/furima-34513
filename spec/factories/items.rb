FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    price            { 1000 }
    category_id      { 1 }
    condition_id     { 1 }
    burden_id        { 1 }
    prefecture_id    { 1 }
    days_to_ship_id  { 1 }
    item_description { 'あいうえお' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
