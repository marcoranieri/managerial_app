class CreateDishFoodOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_food_options do |t|
      t.references :dish, null: false,        foreign_key: true
      t.references :food_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
