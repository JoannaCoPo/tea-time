FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Commerce.price }
    status { 0 }
    frequency { Faker::Number.between(from: 0, to: 2) }
    tea
    customer
  end
end
