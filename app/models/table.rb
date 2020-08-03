class Table < ApplicationRecord
  has_many :orders
  has_many :customers
  has_many :dishes, through: :orders
end
