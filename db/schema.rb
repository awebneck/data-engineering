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

ActiveRecord::Schema.define(version: 20140707234207) do

  create_table "merchants", force: true do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchants", ["name"], name: "index_merchants_on_name", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["name"], name: "index_products_on_name", using: :btree

  create_table "purchasers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchasers", ["name"], name: "index_purchasers_on_name", using: :btree

  create_table "purchases", force: true do |t|
    t.integer  "purchaser_id",   null: false
    t.integer  "product_id",     null: false
    t.integer  "merchant_id",    null: false
    t.integer  "count",          null: false
    t.integer  "price_in_cents", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["merchant_id"], name: "index_purchases_on_merchant_id", using: :btree
  add_index "purchases", ["product_id"], name: "index_purchases_on_product_id", using: :btree
  add_index "purchases", ["purchaser_id"], name: "index_purchases_on_purchaser_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",             null: false
    t.string   "crypted_password",  null: false
    t.string   "password_salt",     null: false
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
