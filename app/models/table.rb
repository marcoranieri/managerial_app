class Table < ApplicationRecord
  has_many :orders
  has_many :customers
  has_many :dishes, through: :orders

  # override getter
  def total_amount_cents
    self[:total_amount_cents] ?
      self[:total_amount_cents] / 100 : 0
  end
end
