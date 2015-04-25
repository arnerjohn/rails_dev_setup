# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150425201500) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rider_id"
  end

  create_table "cycling_profiles", force: :cascade do |t|
    t.integer "rider_id"
    t.string  "genre"
    t.string  "pace_preference"
    t.date    "year_started"
    t.string  "group_preference"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string   "full_name",    limit: 255
    t.string   "relationship", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rider_id"
    t.string   "phone"
  end

  add_index "emergency_contacts", ["rider_id"], name: "index_emergency_contacts_on_rider_id"

  create_table "pelotonia_profiles", force: :cascade do |t|
    t.integer "rider_id"
    t.integer "years_ridden"
    t.boolean "living_proof", default: false
    t.boolean "high_roller",  default: false
    t.boolean "scholar",      default: false
    t.boolean "pace_setter",  default: false
    t.boolean "road_lead",    default: false
    t.boolean "ground_lead",  default: false
  end

  add_index "pelotonia_profiles", ["rider_id"], name: "index_pelotonia_profiles_on_rider_id"

  create_table "pelotons", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "website_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rider_id"
  end

  add_index "pelotons", ["rider_id"], name: "index_pelotons_on_rider_id"

  create_table "ride_participations", force: :cascade do |t|
    t.integer  "rider_id"
    t.integer  "ride_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ride_participations", ["ride_id"], name: "index_ride_participations_on_ride_id"
  add_index "ride_participations", ["rider_id"], name: "index_ride_participations_on_rider_id"

  create_table "riders", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "age"
    t.string   "address_1",              limit: 255
    t.string   "address_2",              limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.integer  "zip_code"
    t.string   "region",                 limit: 255
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key",                limit: 255
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "riders", ["email"], name: "index_riders_on_email", unique: true
  add_index "riders", ["reset_password_token"], name: "index_riders_on_reset_password_token", unique: true

  create_table "rides", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "date"
    t.datetime "launch_time"
    t.string   "terrain",     limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
