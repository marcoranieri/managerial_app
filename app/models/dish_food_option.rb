class DishFoodOption < ApplicationRecord
  belongs_to :dish
  belongs_to :food_option
end
