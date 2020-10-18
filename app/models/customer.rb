class Customer < ApplicationRecord
  belongs_to :table

  has_one :detail

  has_many :customer_food_options
  has_many :food_options, through: :customer_food_options

  acts_as_taggable_on :tags

  CUSTOMER_TAG = %w(
    vegetarian
    vegan
    foreign
    child
  )

  scope :tag_names, -> { tag_counts.map(&:name) }
end
