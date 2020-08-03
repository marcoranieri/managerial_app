class Dish < ApplicationRecord
  has_many :orders
  has_many :dish_allergens
end
