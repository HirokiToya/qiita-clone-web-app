# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:  "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password)
end

#マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.articles.create!(title: title) }
  users.each { |user| user.articles.create!(content: content) }
end