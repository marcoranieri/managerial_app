class Dish < ApplicationRecord
  has_many :orders

  has_many :dish_allergens
  has_many :allergens, through: :dish_allergens

  has_many :dish_food_options
  has_many :food_options, through: :dish_food_options

  acts_as_taggable_on :tags
  acts_as_taggable_on :allergens, :options

  ALLERGEN_TAG = %w(
    gluten
    nuts
    dairy
    fish
    egg
    fruit
  )

  CATEGORY_TAG = %w(
    antipasto
    primo
    secondo
    contorno
    dolce
    bevande
    vino
  )

  OPTION_TAG = %w(
    vegetarian
    vegan
    gluten_free
    dairy_free
    nuts_free
  )

end
