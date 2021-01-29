FactoryBot.define do
  factory :item do
    name                  { 'アア' }
    info                  { 'アア' }
    category_id           { '2' }
    sales_status_id       { '2' }
    sipping_fee_status_id { '2' }
    prefecture_id         { '2' }
    scheduled_delivery_id { '2' }
    price                 { '300' }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end
  end
end
