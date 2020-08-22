class Dish < ApplicationRecord
  before_save :set_color

  has_many :orders

  # has_many :dish_allergens
  # has_many :allergens, through: :dish_allergens

  # has_many :dish_food_options
  # has_many :food_options, through: :dish_food_options

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

  DISHES = [
    {
      name: 'Cheese cake',
      price: 600,
      tag: 'antipasto',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Calamari',
      price: 1000,
      tag: 'antipasto',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Mortadella',
      price: 600,
      tag: 'antipasto',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: '(extra) Affettati misti',
      price: 800,
      tag: 'antipasto',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Maccheroni',
      price: 1200,
      tag: 'primo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'trofie',
      price: 1000,
      tag: 'primo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Risotto',
      price: 1200,
      tag: 'primo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'TagliatelleTar',
      price: 1400,
      tag: 'primo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Costine Maiale',
      price: 1600,
      tag: 'secondo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Cntrf Lardo',
      price: 1800,
      tag: 'secondo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Cntrf Balsam',
      price: 1600,
      tag: 'secondo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Cntrf Tartufo',
      price: 2200,
      tag: 'secondo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Polpo',
      price: 1600,
      tag: 'secondo',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Crema Bianca',
      price: 600,
      tag: 'dolce',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Tortino',
      price: 600,
      tag: 'dolce',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Semifreddo',
      price: 600,
      tag: 'dolce',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Acqua',
      price: 200,
      tag: 'bevande',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Vino quarto',
      price: 400,
      tag: 'vino',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Vino mezzo',
      price: 800,
      tag: 'vino',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Vino Bott.',
      price: 1000,
      tag: 'vino',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    },
    {
      name: 'Kafèèéé',
      price: 200,
      tag: 'bevande',
      allergen: Dish::ALLERGEN_TAG.sample(3),
      option: Dish::OPTION_TAG.sample(2)
    }
  ].freeze

  # scope :display_by_tag, (tag) -> { tagged_with(tag)}

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
