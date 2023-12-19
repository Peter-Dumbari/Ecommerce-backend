# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User1 = User.create(
#     name: 'John Doe',
#     email: 'johndoe@test.test',
#     password: 'password123'
# )

# Product1= Product.create(
#     name: 'Mac book',
#     price: '23:00',
#     quantity_available: '50'
# )

# Product2 = Product.create(
#     name: 'Mac book air',
#     price: '23:99',
#     quantity_available: '40',
#     description: "3g dedicated"

# )

accessories_categories = [
  "Laptops",
  "Desktops",
  "Components",
  "Peripherals",
  "Software",
  "Accessories",
  "Networking",
  "Gaming",
  "Storage",
  "Smart Home Devices"  
]

accessories_categories.each do |category_name|
  Category.create(name: category_name)
end

puts "Accessories categories seeded successfully!"
