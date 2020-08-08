class CreateAllergens < ActiveRecord::Migration[6.0]
  def change
    create_table :allergens do |t|
      t.string :name, null: false
      t.text :notes
      t.string :raw_icon

      t.timestamps
    end
  end
end
