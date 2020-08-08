# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_08_174459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergens", force: :cascade do |t|
    t.string "name", null: false
    t.text "notes"
    t.string "raw_icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_food_options", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "food_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_food_options_on_customer_id"
    t.index ["food_option_id"], name: "index_customer_food_options_on_food_option_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["table_id"], name: "index_customers_on_table_id"
  end

  create_table "details", force: :cascade do |t|
    t.boolean "vegetarian", default: false
    t.boolean "vegan", default: false
    t.boolean "child", default: false
    t.boolean "foreign", default: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_details_on_customer_id"
  end

  create_table "dish_allergens", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "allergen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["allergen_id"], name: "index_dish_allergens_on_allergen_id"
    t.index ["dish_id"], name: "index_dish_allergens_on_dish_id"
  end

  create_table "dish_food_options", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "food_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_dish_food_options_on_dish_id"
    t.index ["food_option_id"], name: "index_dish_food_options_on_food_option_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category", null: false
    t.integer "priority", default: 1
    t.integer "price_cents", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_options", force: :cascade do |t|
    t.string "name", null: false
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.bigint "dish_id", null: false
    t.boolean "child", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_orders_on_dish_id"
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "table_number", null: false
    t.integer "pax", default: 0
    t.integer "total_amount_cents", default: 0
    t.boolean "active", default: false
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customer_food_options", "customers"
  add_foreign_key "customer_food_options", "food_options"
  add_foreign_key "customers", "tables"
  add_foreign_key "details", "customers"
  add_foreign_key "dish_allergens", "allergens"
  add_foreign_key "dish_allergens", "dishes"
  add_foreign_key "dish_food_options", "dishes"
  add_foreign_key "dish_food_options", "food_options"
  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "tables"
end
