class Dish < ApplicationRecord
  before_save :set_color

  has_many :orders

  validates_presence_of   :name, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: "must be unique"

  acts_as_taggable_on :tags
  acts_as_taggable_on :allergens, :options


  # # override getter
  # def price
  #   self[:price] / 100
  # end

  # def price_cents=(value)
  #   attribute_will_change!("price_cent") if @price_cents != value

  #   @price_cents = value * 100
  # end

  def set_color
    self.color = COLORS[self.tag_list.first.to_sym] || COLORS[:default]
  end


end
