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

ActiveRecord::Schema.define(version: 20150526195139) do

  create_table "containers", force: :cascade do |t|
    t.integer  "limit"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "province"
    t.string   "zip"
    t.string   "country"
    t.decimal  "longitude",      precision: 9, scale: 6
    t.decimal  "latitude",       precision: 9, scale: 6
    t.integer  "wedding_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "foods", force: :cascade do |t|
    t.string   "food_choice"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "guests", force: :cascade do |t|
    t.integer  "container_id"
    t.integer  "food_id"
    t.text     "food_restrictions"
    t.boolean  "rsvp"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.integer  "wedding_id"
  end

  create_table "registries", force: :cascade do |t|
    t.integer  "wedding_id"
    t.string   "link_to_registry"
    t.string   "store"
    t.string   "image_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "zip"
    t.string   "phone"
    t.decimal  "longitude",                       precision: 9, scale: 6
    t.decimal  "latitude",                        precision: 9, scale: 6
    t.string   "email",                                                   null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

  create_table "weddings", force: :cascade do |t|
    t.string   "partner_1"
    t.string   "partner_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

end
