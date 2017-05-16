FactoryGirl.define do
  factory :bid do
    price {Faker::Number.between(10, 500)}
  end
end
