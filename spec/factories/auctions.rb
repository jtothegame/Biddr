FactoryGirl.define do
  factory :auction do
    title {Faker::App.name}
    description{Faker::Hipster.paragraph(10)}
    ends_on {Faker::Date.forward(23)}
    reserve_price {Faker::Number.between(10, 1000)}
  end
end
