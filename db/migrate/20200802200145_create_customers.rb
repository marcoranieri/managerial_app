class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.boolean :vegetarian
      t.boolean :gluten_free
      t.boolean :child
      t.boolean :foreign
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
