class Customer < ApplicationRecord
  belongs_to :table

  has_one :detail

  has_many :customer_food_options
  has_many :food_options, through: :customer_food_options
end
