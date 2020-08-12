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
a = Dish.new name: "tagliere", price_cents: 12
a.tag_list = 'antipasto'
a.allergen_list = Dish::ALLERGEN_TAG.sample(2)
a.option_list = Dish::OPTION_TAG.sample(2)
a.save

a = Dish.new name: "spaghetti", price_cents: 14
a.tag_list = 'primo'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample(2)
a.save

a = Dish.new name: "lasagna", price_cents: 6
a.tag_list = 'primo'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "meat", price_cents: 18
a.tag_list = 'secondo'
a.allergen_list = Dish::ALLERGEN_TAG.sample(2)
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "tagliata", price_cents: 16
a.tag_list = 'secondo'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "salad", price_cents: 8
a.tag_list = 'contorno'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "patate", price_cents: 4
a.tag_list = 'contorno'
a.allergen_list = Dish::ALLERGEN_TAG.sample(4)
a.option_list = Dish::OPTION_TAG.sample(2)
a.save

a = Dish.new name: "tortino", price_cents: 6
a.tag_list = 'dolce'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "acqua", price_cents: 2
a.tag_list = 'bevande'
a.allergen_list = Dish::ALLERGEN_TAG.sample
a.option_list = Dish::OPTION_TAG.sample
a.save

a = Dish.new name: "sagrantino", price_cents: 26
a.tag_list = 'vino'
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
