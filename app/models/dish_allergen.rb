class DishAllergen < ApplicationRecord
  belongs_to :allergen
  belongs_to :dish
end
