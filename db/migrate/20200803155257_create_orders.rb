class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :table, null: false, foreign_key: true
      t.references :dish,  null: false, foreign_key: true

      t.integer :priority,    default: 1
      t.boolean :child, default: false

      t.timestamps
    end
  end
end
