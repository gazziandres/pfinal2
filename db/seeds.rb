# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plato.destroy_all
User.destroy_all


12.times do |i|
  Plato.create(
    photo: "https://www.farmboy.ca/wp-content/uploads/2014/12/garden_salad1.jpg",
    name: Faker::Food.dish,
    description: Faker::Food.ingredient,
    price: Faker::Commerce.price.to_i
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

10.times do |i|
  User.create(email:"usuario#{i}@gmail.com", password:'123456')
end
