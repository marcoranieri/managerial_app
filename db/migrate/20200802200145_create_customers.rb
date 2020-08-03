class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.boolean :vegetarian, default: false
      t.boolean :gluten_free, default: false
      t.boolean :child, default: false
      t.boolean :foreign, default: false
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
