20.times do
  Auction.create(title: Faker::App.name, description: Faker::Hipster.paragraph(10), ends_on: Faker::Date.forward(23), reserve: Faker::Number.between(10, 1000))
end

User.create(first_name: 'Josh', last_name: 'Gamble', email:'josh@gamble.com', password: 'qweqwe')
User.create(first_name: 'Jay', last_name: 'Game', email:'jay@game.com', password: 'qweqwe')
