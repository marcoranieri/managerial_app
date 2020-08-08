class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.boolean :vegetarian,  default: false
      t.boolean :vegan,       default: false
      t.boolean :child,       default: false
      t.boolean :foreign,     default: false

      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
