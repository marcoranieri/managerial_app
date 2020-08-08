class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.integer :table_number,       null: false
      t.integer :pax,                default: 0
      t.integer :total_amount_cents, default: 0
      t.boolean :active,             default: false
      t.text :notes

      t.timestamps
    end
  end
end
