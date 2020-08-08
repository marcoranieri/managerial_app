class Allergen < ApplicationRecord
  has_many :dish_allergens
  has_many :dishes, through: :dish_allergens
end
