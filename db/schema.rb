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

ActiveRecord::Schema.define(version: 20171031085947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "disapproves", force: :cascade do |t|
    t.bigint "foody_id"
    t.bigint "restaurant_id"
    t.index ["foody_id"], name: "index_disapproves_on_foody_id"
    t.index ["restaurant_id"], name: "index_disapproves_on_restaurant_id"
  end

  create_table "foodies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.text "status"
    t.index ["email"], name: "index_foodies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_foodies_on_reset_password_token", unique: true
  end

  create_table "likeables", force: :cascade do |t|
    t.integer "review", default: 1
    t.bigint "foody_id"
    t.bigint "photo_id"
    t.index ["foody_id"], name: "index_likeables_on_foody_id"
    t.index ["photo_id"], name: "index_likeables_on_photo_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "restaurant"
    t.text "description"
    t.string "avatar"
    t.string "tag_list"
    t.decimal "price", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "foody_id"
    t.bigint "tag_id"
    t.index ["foody_id"], name: "index_photos_on_foody_id"
    t.index ["tag_id"], name: "index_photos_on_tag_id"
  end

  create_table "recommends", force: :cascade do |t|
    t.bigint "foody_id"
    t.bigint "restaurant_id"
    t.index ["foody_id"], name: "index_recommends_on_foody_id"
    t.index ["restaurant_id"], name: "index_recommends_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.string "time"
    t.string "certification"
    t.string "category"
    t.bigint "tag_id"
    t.index ["tag_id"], name: "index_restaurants_on_tag_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keyword"
    t.string "certification"
    t.string "location"
    t.string "category"
    t.decimal "min_price"
    t.decimal "max_price"
  end

  create_table "taggings", force: :cascade do |t|
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "disapproves", "foodies"
  add_foreign_key "disapproves", "restaurants"
  add_foreign_key "likeables", "foodies"
  add_foreign_key "likeables", "photos"
  add_foreign_key "photos", "foodies"
  add_foreign_key "photos", "tags"
  add_foreign_key "recommends", "foodies"
  add_foreign_key "recommends", "restaurants"
  add_foreign_key "restaurants", "tags"
end
