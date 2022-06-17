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

ActiveRecord::Schema.define(version: 2022_06_17_115028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climbing_block_colors", force: :cascade do |t|
    t.string "block_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climbing_levels", force: :cascade do |t|
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climbing_performances", force: :cascade do |t|
    t.bigint "sport_user_id"
    t.integer "level", default: 0
    t.string "block_color", default: "Unknown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_user_id"], name: "index_climbing_performances_on_sport_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "friend_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_connections_on_friend_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
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

  create_table "suggestions", force: :cascade do |t|
    t.bigint "partner_id"
    t.bigint "user_id"
    t.boolean "accepted"
    t.boolean "refused"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_suggestions_on_partner_id"
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "tennis_performances", force: :cascade do |t|
    t.bigint "sport_user_id"
    t.string "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_user_id"], name: "index_tennis_performances_on_sport_user_id"
  end

  create_table "tennis_ranks", force: :cascade do |t|
    t.string "rank"
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
    t.string "address"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "climbing_performances", "sport_users", on_delete: :cascade
  add_foreign_key "events", "cities"
  add_foreign_key "events", "sports"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
  add_foreign_key "running_performances", "sport_users", on_delete: :cascade
  add_foreign_key "sport_users", "sports"
  add_foreign_key "sport_users", "users"
  add_foreign_key "tennis_performances", "sport_users", on_delete: :cascade
  add_foreign_key "workout_performances", "sport_users", on_delete: :cascade
end
