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

ActiveRecord::Schema.define(version: 2018_10_20_000418) do

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

  create_table "administrative_areas", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_administrative_areas_on_country_id"
  end

  create_table "band_events", force: :cascade do |t|
    t.bigint "band_id"
    t.bigint "event_id"
    t.index ["band_id"], name: "index_band_events_on_band_id"
    t.index ["event_id"], name: "index_band_events_on_event_id"
  end

  create_table "band_ratings", force: :cascade do |t|
    t.bigint "rating_id"
    t.bigint "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_ratings_on_band_id"
    t.index ["rating_id"], name: "index_band_ratings_on_rating_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "genre", default: "No Genre Specified"
    t.integer "locality_id"
    t.string "name"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
  end

  create_table "localities", force: :cascade do |t|
    t.string "name"
    t.bigint "administrative_area_id"
    t.index ["administrative_area_id"], name: "index_localities_on_administrative_area_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.float "score", default: 0.0
    t.text "comment", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bands", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "band_id"
    t.index ["band_id"], name: "index_user_bands_on_band_id"
    t.index ["user_id"], name: "index_user_bands_on_user_id"
  end

  create_table "user_omniauth_credentials", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_user_omniauth_credentials_on_user_id"
  end

  create_table "user_ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_id"], name: "index_user_ratings_on_rating_id"
    t.index ["user_id"], name: "index_user_ratings_on_user_id"
  end

  create_table "user_venues", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "venue_id"
    t.index ["user_id"], name: "index_user_venues_on_user_id"
    t.index ["venue_id"], name: "index_user_venues_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.string "encrypted_password"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "venue_events", force: :cascade do |t|
    t.bigint "venue_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_venue_events_on_event_id"
    t.index ["venue_id"], name: "index_venue_events_on_venue_id"
  end

  create_table "venue_ratings", force: :cascade do |t|
    t.bigint "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id"
    t.index ["rating_id"], name: "index_venue_ratings_on_rating_id"
    t.index ["venue_id"], name: "index_venue_ratings_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.bigint "locality_id"
    t.index ["locality_id"], name: "index_venues_on_locality_id"
  end

  add_foreign_key "administrative_areas", "countries"
  add_foreign_key "band_events", "bands"
  add_foreign_key "band_events", "events"
  add_foreign_key "band_ratings", "bands"
  add_foreign_key "band_ratings", "ratings"
  add_foreign_key "localities", "administrative_areas"
  add_foreign_key "user_bands", "bands"
  add_foreign_key "user_bands", "users"
  add_foreign_key "user_ratings", "ratings"
  add_foreign_key "user_ratings", "users"
  add_foreign_key "user_venues", "users"
  add_foreign_key "user_venues", "venues"
  add_foreign_key "venue_events", "events"
  add_foreign_key "venue_events", "venues"
  add_foreign_key "venue_ratings", "ratings"
  add_foreign_key "venue_ratings", "venues"
  add_foreign_key "venues", "localities"
end
