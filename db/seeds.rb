# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address
  )
end

5.times do
  Tea.create(
    name: Faker::Tea.variety,
    description: Faker::Tea.type,
    origin: Faker::Nation.nationality,
    brew_time: Faker::Number.between(from: 1, to: 5)
  )
end

5.times do
   Customer.all.sample.subscriptions.create(
     title: Faker::Subscription.plan,
     price: Faker::Commerce.price,
     status: Faker::Nation.nationality,
     frequency: Faker::Number.between(from: 0, to: 2),
     tea_id: Tea.all.sample.id
   )
end
