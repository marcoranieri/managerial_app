class Dish < ApplicationRecord
  before_save :set_color

  has_many :orders

  has_many :dish_allergens
  has_many :allergens, through: :dish_allergens

  has_many :dish_food_options
  has_many :food_options, through: :dish_food_options

  acts_as_taggable_on :tags
  acts_as_taggable_on :allergens, :options

  ALLERGEN_TAG = %w(
    gluten
    nuts
    dairy
    fish
    egg
    fruit
  )

  CATEGORY_TAG = %w(
    antipasto
    primo
    secondo
    contorno
    dolce
    bevande
    vino
  )

  OPTION_TAG = %w(
    vegetarian
    vegan
    gluten_free
    dairy_free
    nuts_free
  )

  COLORS = {
    antipasto: "#fcedc5",
    primo:     "#a1d7c9",
    secondo:   "#efc5b5",
    contorno:  "#d6fffe",
    dolce:     "#e6e8fa",
    bevande:   "#cae9ff",
    # vino:      "#990033",
    vino:      "#d8a1c4",

    default: "#ffffc7"
  }


  scope :display_by_tags, -> { tagged_with("antipasto")}

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
    #Ex:- :default =>'']
  end


end
