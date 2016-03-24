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

ActiveRecord::Schema.define(version: 20160324135540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_ingredients", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string   "name",                 null: false
    t.integer  "active_ingredient_id", null: false
    t.integer  "dose",                 null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "medicines", ["active_ingredient_id"], name: "index_medicines_on_active_ingredient_id", using: :btree

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "patient_id",  null: false
    t.integer  "medicine_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "prescriptions", ["medicine_id"], name: "index_prescriptions_on_medicine_id", using: :btree
  add_index "prescriptions", ["patient_id"], name: "index_prescriptions_on_patient_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "name",            null: false
    t.string   "insurance"
    t.integer  "age",             null: false
    t.string   "gender",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
