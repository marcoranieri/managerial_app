class CreateFoodOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :food_options do |t|
      t.string :name, null: false
      t.text :notes

      t.timestamps
    end
  end
end
