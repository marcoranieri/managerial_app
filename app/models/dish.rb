class Dish < ApplicationRecord
  has_many :orders

  has_many :dish_allergens
  has_many :allergens, through: :dish_allergens

  has_many :dish_food_options
  has_many :food_options, through: :dish_food_options

  CATEGORIES = [
    'antipasto',
    'primo',
    'secondo',
    'contorno',
    'dolce',
    'bevande',
    'vino'
  ]
end
