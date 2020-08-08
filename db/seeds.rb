DishFoodOption.destroy_all
CustomerFoodOption.destroy_all
FoodOption.destroy_all
DishAllergen.destroy_all
Allergen.destroy_all
Detail.destroy_all
Customer.destroy_all
Order.destroy_all
Dish.destroy_all
Table.destroy_all
User.destroy_all


# USER
User.create email: "admin@admin.com", password: "123456"


# TABLE
Table.create table_number: 1, pax: rand(1..5)
Table.create table_number: 2 #, pax: rand(1..5)
Table.create table_number: 3, pax: rand(1..5)
puts "\n\nCreating Tables - tot: #{Table.count}\n"


# CUSTOMER
Customer.create table: Table.first
Customer.create table: Table.first
Customer.create table: Table.first

Customer.create table: Table.last
Customer.create table: Table.last
Customer.create table: Table.last
Customer.create table: Table.last
puts "\n\nCreating Customers - tot: #{Customer.count}\n"


# DETAIL
Detail.create customer: Customer.all.sample, vegetarian: true
Detail.create customer: Customer.all.sample, vegan: true
Detail.create customer: Customer.all.sample, vegetarian: true
Detail.create customer: Customer.all.sample, foreign: true
Detail.create customer: Customer.all.sample, child: true
puts "\n\nCreating Details - tot: #{Detail.count}\n"


# DISH
Dish.create name: "spaghetti", price_cents: 1400, category: "primo"
Dish.create name: "salad", price_cents: 800, category: "contorno"
Dish.create name: "meat", price_cents: 1800, category: "secondo"
Dish.create name: "tagliata", price_cents: 600, category: "secondo"
Dish.create name: "lasagna", price_cents: 600, category: "primo"
Dish.create name: "tagliere", price_cents: 600, category: "antipasto"
Dish.create name: "tortino", price_cents: 600, category: "dolce"
Dish.create name: "patate", price_cents: 600, category: "contorno"
puts "\n\nCreating Dishes - tot: #{Dish.count}\n"


# ORDER
Order.create dish: Dish.all.sample, table: Table.first
Order.create dish: Dish.all.sample, table: Table.first
Order.create dish: Dish.all.sample, table: Table.first
Order.create dish: Dish.all.sample, table: Table.first
Order.create dish: Dish.all.sample, table: Table.last
Order.create dish: Dish.all.sample, table: Table.last
Order.create dish: Dish.all.sample, table: Table.last
puts "\n\nCreating Orders - tot: #{Order.count}\n"


# ALLERGEN
Allergen.create name: "gluten"
Allergen.create name: "nuts"
Allergen.create name: "dairy"
Allergen.create name: "fish"
Allergen.create name: "egg"
Allergen.create name: "fruit"
puts "\n\nCreating Allergens - tot: #{Allergen.count}\n"


# DISH_ALLERGEN
DishAllergen.create allergen: Allergen.all.sample, dish: Dish.all.sample
DishAllergen.create allergen: Allergen.all.sample, dish: Dish.all.sample
DishAllergen.create allergen: Allergen.all.sample, dish: Dish.all.sample
DishAllergen.create allergen: Allergen.all.sample, dish: Dish.all.sample
puts "\n\nCreating DishAllergens - tot: #{DishAllergen.count}\n"


# FOOD_OPTION
FoodOption.create name: "vegetarian"
FoodOption.create name: "vegan"
FoodOption.create name: "gluten_free"
FoodOption.create name: "dairy"
FoodOption.create name: "nuts_free"
puts "\n\nCreating FoodOptions - tot: #{FoodOption.count}\n"


# DISH_FOOD_OPTION
DishFoodOption.create food_option: FoodOption.all.sample, dish: Dish.all.sample
DishFoodOption.create food_option: FoodOption.all.sample, dish: Dish.all.sample
DishFoodOption.create food_option: FoodOption.all.sample, dish: Dish.all.sample
puts "\n\nCreating DishFoodOptions - tot: #{DishFoodOption.count}\n"


# CUSTOMER_FOOD_OPTION
CustomerFoodOption.create food_option: FoodOption.all.sample, customer: Customer.all.sample
CustomerFoodOption.create food_option: FoodOption.all.sample, customer: Customer.all.sample
CustomerFoodOption.create food_option: FoodOption.all.sample, customer: Customer.all.sample
puts "\n\nCreating CustomerFoodOptions - tot: #{CustomerFoodOption.count}\n"