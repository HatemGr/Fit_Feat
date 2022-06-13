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

ActiveRecord::Schema.define(version: 2022_06_13_162730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "sport_id"
    t.bigint "city_id"
    t.string "title"
    t.string "description"
    t.datetime "date"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_events_on_admin_id"
    t.index ["city_id"], name: "index_events_on_city_id"
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "running_performances", force: :cascade do |t|
    t.bigint "sport_user_id"
    t.integer "distance"
    t.integer "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_user_id"], name: "index_running_performances_on_sport_user_id"
  end

  create_table "sport_users", force: :cascade do |t|
    t.bigint "sport_id"
    t.bigint "user_id"
    t.integer "experience"
    t.integer "frequency"
    t.float "perf_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_sport_users_on_sport_id"
    t.index ["user_id"], name: "index_sport_users_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_performances", force: :cascade do |t|
    t.bigint "sport_user_id"
    t.integer "benchpress_weight"
    t.integer "squat_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_user_id"], name: "index_workout_performances_on_sport_user_id"
  end

  add_foreign_key "events", "cities"
  add_foreign_key "events", "sports"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
  add_foreign_key "running_performances", "sport_users"
  add_foreign_key "sport_users", "sports"
  add_foreign_key "sport_users", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "workout_performances", "sport_users"
end
