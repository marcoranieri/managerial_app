class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name,         null: false
      t.string :color,        default: "#ffffc7"
      t.integer :priority,    default: 1
      t.integer :price_cents, default: 0

      t.timestamps
    end
  end
end
