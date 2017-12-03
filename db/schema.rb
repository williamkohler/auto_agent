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

ActiveRecord::Schema.define(version: 20171203212220) do

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.integer "hubspot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artist_relationships", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "user_id"], name: "index_artist_relationships_on_artist_id_and_user_id", unique: true
    t.index ["artist_id"], name: "index_artist_relationships_on_artist_id"
    t.index ["user_id"], name: "index_artist_relationships_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "artist_id"
    t.datetime "start_date"
    t.text "venue_name"
    t.text "address"
    t.integer "capacity"
    t.text "ticket_scale"
    t.integer "gross_potential"
    t.text "start_time"
    t.text "set_length"
    t.integer "num_of_shows"
    t.text "other_acts"
    t.datetime "contract_due"
    t.float "deposit_due"
    t.float "deposit_received"
    t.float "fee"
    t.text "backend"
    t.text "hotel"
    t.text "ground"
    t.text "backline"
    t.text "promoter_name"
    t.text "promoter_phone"
    t.text "promoter_email"
    t.text "production_name"
    t.text "production_phone"
    t.text "production_email"
    t.datetime "announce"
    t.datetime "on_sale"
    t.datetime "end_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
