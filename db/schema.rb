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

ActiveRecord::Schema.define(version: 20171127054829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_followers", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_followers_on_event_id"
    t.index ["follower_id", "event_id"], name: "index_event_followers_on_follower_id_and_event_id", unique: true
    t.index ["follower_id"], name: "index_event_followers_on_follower_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "from"
    t.datetime "to"
    t.decimal "lat"
    t.decimal "lng"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_posts_on_event_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "gender"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "users"
  add_foreign_key "posts", "events"
  add_foreign_key "posts", "users"
end
