# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

item1 = Item.create(name: "first", weight: 100, container: 1)
item2 = Item.create(name: "second", weight: 400, container: 1)
item3 = Item.create(name: "third", weight: 1400, container: 2)
item4 = Item.create(name: "fourth", weight: 500, container: 3)
