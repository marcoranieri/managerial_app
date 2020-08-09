Customer.destroy_all
Order.destroy_all
Dish.destroy_all
Table.destroy_all
User.destroy_all


# USER
User.create email: "admin@admin.com", password: "123456"


# TABLE
Table.create table_number: 1, pax: rand(1..5), notes: "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ex iusto animi aut, quaerat.."
Table.create table_number: 2 #, pax: rand(1..5)
Table.create table_number: 3, pax: rand(1..5)
puts "\n\nCreating Tables - tot: #{Table.count}\n"


# CUSTOMER
a = Customer.new(table: Table.first)
a.tag_list = ["#{Customer::CUSTOMER_TAG.sample}", "#{Customer::CUSTOMER_TAG.sample}"]
a.save
a = Customer.new table: Table.first
a.tag_list = Customer::CUSTOMER_TAG.sample
a.save
a = Customer.new table: Table.first
a.tag_list = Customer::CUSTOMER_TAG.sample
a.save

a = Customer.new table: Table.last
a.tag_list = ["#{Customer::CUSTOMER_TAG.sample}", "#{Customer::CUSTOMER_TAG.sample}"]
a.save
a = Customer.new table: Table.last
a.tag_list = Customer::CUSTOMER_TAG.sample
a.save
a = Customer.new table: Table.last
a.tag_list = Customer::CUSTOMER_TAG.sample
a.save
a = Customer.new table: Table.last
a.tag_list = Customer::CUSTOMER_TAG.sample
a.save
puts "\n\nCreating Customers - tot: #{Customer.count}\n"



# DISH
a = Dish.new name: "tagliere", price_cents: 1200
a.tag_list = 'antipasto'
a.allergen_list = Dish::ALLERGEN_TAG.sample(2)
a.option_list = Dish::OPTION_TAG.sample(2)
a.save

a = Dish.new name: "spaghetti", price_cents: 1400
a.tag_list = 'primo'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample(2)
a.save

a = Dish.new name: "lasagna", price_cents: 600
a.tag_list = 'primo'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "meat", price_cents: 1800
a.tag_list = 'secondo'
a.allergen_list = Dish::ALLERGEN_TAG.sample(2)
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "tagliata", price_cents: 1600
a.tag_list = 'secondo'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "salad", price_cents: 800
a.tag_list = 'contorno'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "patate", price_cents: 400
a.tag_list = 'contorno'
a.allergen_list = Dish::ALLERGEN_TAG.sample(4)
a.option_list = Dish::OPTION_TAG.sample(2)
a.save

a = Dish.new name: "tortino", price_cents: 600
a.tag_list = 'dolce'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

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
