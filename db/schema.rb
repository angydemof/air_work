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

ActiveRecord::Schema.define(version: 2019_12_10_133045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "office_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "number_of_people"
    t.string "status"
    t.string "payment_status"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_bookings_on_office_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.integer "capacity"
    t.integer "size"
    t.bigint "photo_id"
    t.bigint "user_id"
    t.boolean "wifi"
    t.boolean "coffee_machine"
    t.boolean "somking_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_offices_on_photo_id"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo_1"
    t.string "photo_2"
    t.string "photo_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "offices"
  add_foreign_key "bookings", "users"
  add_foreign_key "offices", "photos"
  add_foreign_key "offices", "users"
  add_foreign_key "reviews", "bookings"
end
