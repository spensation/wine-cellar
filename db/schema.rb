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

ActiveRecord::Schema.define(version: 20180820052106) do

  create_table "appellations", force: :cascade do |t|
    t.string "name"
    t.string "tier"
    t.string "region"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bottles", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "vintage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "category"
    t.integer "producer_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.date "established"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "appellation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "varietals", force: :cascade do |t|
    t.string "name"
    t.string "country_of_origin"
    t.integer "appellation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
