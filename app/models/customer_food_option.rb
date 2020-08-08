class CustomerFoodOption < ApplicationRecord
  belongs_to :customer
  belongs_to :food_option
end
