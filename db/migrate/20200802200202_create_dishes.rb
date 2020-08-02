class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price_cents
      t.boolean :vegetarian
      t.boolean :gluten_free
      t.string :category
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
