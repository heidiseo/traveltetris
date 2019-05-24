# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_24_151411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.jsonb "payment"
    t.string "state"
    t.bigint "plan_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_bookings_on_plan_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_bookings", force: :cascade do |t|
    t.string "first_name_passenger"
    t.string "last_name_passenger"
    t.string "passport"
    t.string "nationality"
    t.bigint "booking_id"
    t.bigint "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_flight_bookings_on_booking_id"
    t.index ["flight_id"], name: "index_flight_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.string "flight_number"
    t.string "photo"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.bigint "departure_city_id"
    t.bigint "arrival_city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_city_id"], name: "index_flights_on_arrival_city_id"
    t.index ["departure_city_id"], name: "index_flights_on_departure_city_id"
  end

  create_table "plan_cities", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_plan_cities_on_city_id"
    t.index ["plan_id"], name: "index_plan_cities_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city1"
    t.string "city2"
    t.datetime "start_date1"
    t.datetime "end_date1"
    t.datetime "start_date2"
    t.datetime "end_date2"
    t.index ["city_id"], name: "index_plans_on_city_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "trip_dates", force: :cascade do |t|
    t.bigint "plan_id"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_trip_dates_on_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "plans"
  add_foreign_key "flight_bookings", "bookings"
  add_foreign_key "flight_bookings", "flights"
  add_foreign_key "flights", "cities", column: "arrival_city_id"
  add_foreign_key "flights", "cities", column: "departure_city_id"
  add_foreign_key "plan_cities", "cities"
  add_foreign_key "plan_cities", "plans"
  add_foreign_key "plans", "cities"
  add_foreign_key "plans", "users"
  add_foreign_key "trip_dates", "plans"
end
