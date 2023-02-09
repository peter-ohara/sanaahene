# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_09_101310) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "electricity_meters", force: :cascade do |t|
    t.string "name", null: false
    t.string "meter_number", null: false
    t.decimal "reorder_point", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meter_number"], name: "index_electricity_meters_on_meter_number", unique: true
    t.index ["name"], name: "index_electricity_meters_on_name", unique: true
  end

  create_table "inventory_entries", force: :cascade do |t|
    t.datetime "happened_at", null: false
    t.bigint "item_id", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.decimal "quantity", precision: 8, scale: 2
    t.bigint "attendee_id", null: false
    t.text "notes"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meter_id", null: false
    t.index ["attendee_id"], name: "index_inventory_entries_on_attendee_id"
    t.index ["item_id"], name: "index_inventory_entries_on_item_id"
    t.index ["meter_id"], name: "index_inventory_entries_on_meter_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "inventory_entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_entry_id"], name: "index_taggings_on_inventory_entry_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "other_names"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

  add_foreign_key "inventory_entries", "electricity_meters", column: "meter_id"
  add_foreign_key "inventory_entries", "items"
  add_foreign_key "inventory_entries", "users", column: "attendee_id"
  add_foreign_key "taggings", "inventory_entries"
  add_foreign_key "taggings", "tags"
end
