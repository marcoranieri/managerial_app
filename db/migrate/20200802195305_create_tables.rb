class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :table_number
      t.integer :pax
      t.integer :total_amount_cents
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
