DishAllergen.destroy_all
Allergen.destroy_all
Customer.destroy_all
Order.destroy_all
Dish.destroy_all
Table.destroy_all


Table.create table_number: 1, pax: rand(1..5)
Table.create table_number: 2 #, pax: rand(1..5)
Table.create table_number: 3, pax: rand(1..5)
puts "\n\nCreating Tables - tot: #{Table.count}\n\n"

Customer.create table: Table.first
Customer.create table: Table.first
Customer.create table: Table.first
Customer.create table: Table.last
Customer.create table: Table.last
Customer.create table: Table.last
Customer.create table: Table.last
puts "\n\nCreating Customers - tot: #{Customer.count}\n\n"

Dish.create name: "spaghetti", price_cents: 14
Dish.create name: "salad", price_cents: 8, vegetarian: true
Dish.create name: "meat", price_cents: 18, gluten_free: true
Dish.create name: "cake", price_cents: 6
puts "\n\nCreating Dishes - tot: #{Dish.count}\n\n"

Order.create dish: Dish.first, table: Table.first
Order.create dish: Dish.last, table: Table.first
Order.create dish: Dish.first, table: Table.last
Order.create dish: Dish.last, table: Table.last
puts "\n\nCreating Orders - tot: #{Order.count}\n\n"

Allergen.create name: "gluten"
Allergen.create name: "nuts"
puts "\n\nCreating Allergens - tot: #{Allergen.count}\n\n"

DishAllergen.create allergen: Allergen.first, dish: Dish.first
DishAllergen.create allergen: Allergen.last, dish: Dish.first
puts "\n\nCreating DishAllergens - tot: #{DishAllergen.count}\n\n"