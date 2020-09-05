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
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Calamari',
      price: 1000,
      tag: 'antipasto',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Mortadella',
      price: 600,
      tag: 'antipasto',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: '(extra) Affettati misti',
      price: 800,
      tag: 'antipasto',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Maccheroni',
      price: 1200,
      tag: 'primo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'trofie',
      price: 1000,
      tag: 'primo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Risotto',
      price: 1200,
      tag: 'primo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'TagliatelleTar',
      price: 1400,
      tag: 'primo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Costine Maiale',
      price: 1600,
      tag: 'secondo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Cntrf Lardo',
      price: 1800,
      tag: 'secondo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Cntrf Balsam',
      price: 1600,
      tag: 'secondo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Cntrf Tartufo',
      price: 2200,
      tag: 'secondo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Polpo',
      price: 1600,
      tag: 'secondo',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Crema Bianca',
      price: 600,
      tag: 'dolce',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Tortino',
      price: 600,
      tag: 'dolce',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Semifreddo',
      price: 600,
      tag: 'dolce',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Acqua',
      price: 200,
      tag: 'bevande',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Vino quarto',
      price: 400,
      tag: 'vino',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Vino mezzo',
      price: 800,
      tag: 'vino',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Vino Bott.',
      price: 1000,
      tag: 'vino',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    },
    {
      name: 'Kafèèéé',
      price: 200,
      tag: 'bevande',
      allergen: ALLERGEN_TAG.sample(3),
      option: OPTION_TAG.sample(2)
    }
  ]

