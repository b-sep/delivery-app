# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_26_042219) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "delivery_dates", force: :cascade do |t|
    t.integer "distance_1"
    t.integer "distance_2"
    t.integer "days"
    t.integer "hauler_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hauler_id"], name: "index_delivery_dates_on_hauler_id"
  end

  create_table "haulers", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.string "registration_number"
    t.string "address"
    t.string "email_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
  end

  create_table "orders", force: :cascade do |t|
    t.integer "heigth"
    t.integer "depth"
    t.integer "width"
    t.integer "distance"
    t.integer "weight"
    t.integer "hauler_id", null: false
    t.integer "status"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.string "days"
    t.index ["hauler_id"], name: "index_orders_on_hauler_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "min_cubic_meter"
    t.decimal "max_cubic_meter"
    t.integer "min_weight"
    t.integer "max_weight"
    t.decimal "km_price"
    t.integer "hauler_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hauler_id"], name: "index_prices_on_hauler_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birth_date"
    t.integer "hauler_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hauler_id"], name: "index_users_on_hauler_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.integer "full_load"
    t.string "car_model"
    t.string "year"
    t.string "vehicle_brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hauler_id", null: false
    t.index ["hauler_id"], name: "index_vehicles_on_hauler_id"
  end

  add_foreign_key "delivery_dates", "haulers"
  add_foreign_key "orders", "haulers"
  add_foreign_key "prices", "haulers"
  add_foreign_key "users", "haulers"
  add_foreign_key "vehicles", "haulers"
end
