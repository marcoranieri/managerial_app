class CreateDishAllergens < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_allergens do |t|
      t.references :dish,     null: false, foreign_key: true
      t.references :allergen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
