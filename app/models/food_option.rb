class FoodOption < ApplicationRecord
  has_many :customer_food_options
  has_many :customers, through: :customer_food_options

  has_many :dish_food_options
  has_many :dishes, through: :dish_food_options
end
