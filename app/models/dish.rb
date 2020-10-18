class Dish < ApplicationRecord
  before_save :set_color

  has_many :orders

  # validates_presence_of   :name, on: :create, message: "can't be blank"
  # validates_uniqueness_of :name, on: :create, message: "must be unique"

  validates :name, presence: true, uniqueness: true

  acts_as_taggable_on :tags
  acts_as_taggable_on :allergens, :options


  def price
    self[:price_cents] / 100
    # '%.2f' % self[:price_cents].to_f
  end

  def set_color
    self.color = COLORS[self.tag_list&.first&.to_sym] || COLORS[:default]
  end

end
