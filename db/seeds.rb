# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Plato.destroy_all
User.destroy_all
Order.destroy_all


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

12.times do |x|
  User.create(email:"usuario#{x}@gmail.com", password:'123456')
end

#Plato.destroy_all

12.times do |i|
  Plato.create(
    photo: "https://www.farmboy.ca/wp-content/uploads/2014/12/garden_salad1.jpg",
    name: Faker::Food.dish,
    description: Faker::Food.ingredient,
    price: Faker::Commerce.price.to_i)
  end

  random = rand(1..6)

  case random
    when 1
      tipo = "Verdes"
    when 2
      tipo = "Premium"
    when 3
      tipo = "Esencial"
    when 4
      tipo = "Otro"
    when 5
      tipo = "Proteina"
    when 6
      tipo = "Queso"
  end

  Ingrediente.create(
    id_tipo: random,
    nombre: tipo+" "+Faker::Name.first_name,
    foto: Faker::LoremPixel.image("50x60", true),
    precio: Faker::Commerce.price.to_i,
    grasa: rand(30),
    grasa_saturada: rand(30),
    grasa_trans: rand(30),
    colesterol: rand(30),
    sodio: rand(30),
    carbohidrato: rand(30),
    fibra_dietetica: rand(30),
    azucar: rand(30),
    proteina: rand(30)
  )


addresses = ["Av. Apoquindo 6282, Las Condes",
"Liverpool, NY 13090",
"8248 Buttonwood Drive",
"Herndon, VA 20170",
"953 Lake View Lane",
"Greensburg, PA 15601",
"8489 Smith Store Street",
"Wake Forest, NC 27587",
"60 Pumpkin Hill Dr.",
"South Ozone Park, NY 11420",
"923 Wakehurst L",
"New Orleans, LA 70115",
"995 Lakewood Court",
"Upland, CA 91784"]

#addresses.each do |address|
 #Order.create!(user_id: rand(1..10), plato_id: rand(1..10), address: address)
addresses.each do |address|
  order = Order.new(
		user: User.first,
    plato: Plato.first,
    address: address
		)
  if order.save!
    puts "se guardo la orden #{order.id} :)"
  end
 sleep 1
end
