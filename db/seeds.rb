DishAllergen.destroy_all
Allergen.destroy_all
Customer.destroy_all
Dish.destroy_all
Table.destroy_all


Table.create table_number: "1"
puts "\n\nCreating Tables - #{Table.count}\n\n"

Customer.create table: Table.first
Customer.create table: Table.first
Customer.create table: Table.first
puts "\n\nCreating Customers - #{Customer.count}\n\n"

Dish.create name: "spaghetti", table: Table.first
Dish.create name: "salad", table: Table.first
Dish.create name: "meat", table: Table.first
Dish.create name: "cake", table: Table.first
puts "\n\nCreating Dishes - #{Dish.count}\n\n"

Allergen.create name: "gluten"
Allergen.create name: "nuts"
puts "\n\nCreating Allergens - #{Allergen.count}\n\n"

DishAllergen.create allergen: Allergen.first, dish: Dish.first
DishAllergen.create allergen: Allergen.last, dish: Dish.first
puts "\n\nCreating DishAllergens - #{DishAllergen.count}\n\n"