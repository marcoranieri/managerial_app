class Dish < ApplicationRecord
  belongs_to :table
  has_many :dish_allergens
end
