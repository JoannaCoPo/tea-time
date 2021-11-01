FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    description { Faker::Tea.type }
    origin { Faker::Nation.nationality }
    brew_time { Faker::Number.between(from: 1, to: 5) }
  end
end
