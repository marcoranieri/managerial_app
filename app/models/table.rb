class Table < ApplicationRecord
  has_many :dishes
  has_many :customers
end
