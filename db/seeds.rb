# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 767.times do
#   Product.create(title:          Faker::Commerce.product_name,
#                  price:          Faker::Number.decimal(l_digits: 2),
#                  stock_quantity: Faker::Number.between(from: 1, to: 500))
# end

require "csv"
Product.destroy_all
Category.destroy_all

csvFile = Rails.root.join("db/products.csv")
csvData = File.read(csvFile)

products = CSV.parse(csvData, headers: true)

products.each do |product|
  category = Category.find_or_create_by(name: product["category"])
  if category.valid?
    newProduct = category.products.create(title:          product["name"],
                                          price:          product["price"],
                                          description:    product["description"],
                                          stock_quantity: product["stock quantity"])
    puts "Fail to create product"
  else
    puts "Fail to create category"
  end
end

puts "Successfuly Created #{Category.count} categories"
puts "Successfuly Created #{Product.count} products"
