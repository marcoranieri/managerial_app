class CreateCustomerFoodOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_food_options do |t|
      t.references :customer,    null: false, foreign_key: true
      t.references :food_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
