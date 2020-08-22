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
Dish::DISHES.each do |dish|
  a = Dish.new name: dish[:name].humanize, price_cents: dish[:price]
  a.tag_list      = dish[:tag]
  a.allergen_list = dish[:allergen]
  a.option_list   = dish[:option]
  a.save
end

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
