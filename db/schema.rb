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

ActiveRecord::Schema[7.0].define(version: 2023_02_22_085924) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "electricity_entries", force: :cascade do |t|
    t.datetime "happened_at", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.decimal "quantity", precision: 8, scale: 2
    t.bigint "attendee_id", null: false
    t.text "notes"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meter_id", null: false
    t.index ["attendee_id"], name: "index_electricity_entries_on_attendee_id"
    t.index ["meter_id"], name: "index_electricity_entries_on_meter_id"
  end

  create_table "electricity_meters", force: :cascade do |t|
    t.string "name", null: false
    t.string "meter_number", null: false
    t.decimal "reorder_point", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meter_number"], name: "index_electricity_meters_on_meter_number", unique: true
    t.index ["name"], name: "index_electricity_meters_on_name", unique: true
  end

  create_table "internet_accounts", force: :cascade do |t|
    t.string "name"
    t.string "usage_type"
    t.string "account_number"
    t.string "phone_number"
    t.string "service_name"
    t.decimal "reorder_point", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_internet_accounts_on_name", unique: true
  end

  create_table "internet_entries", force: :cascade do |t|
    t.datetime "happened_at", null: false
    t.bigint "internet_account_id", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.decimal "quantity", precision: 8, scale: 2, null: false
    t.bigint "attendee_id", null: false
    t.text "notes"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_internet_entries_on_attendee_id"
    t.index ["internet_account_id"], name: "index_internet_entries_on_internet_account_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "electricity_entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["electricity_entry_id"], name: "index_taggings_on_electricity_entry_id"
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
    t.string "email", default: "", null: false
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "electricity_entries", "electricity_meters", column: "meter_id"
  add_foreign_key "electricity_entries", "users", column: "attendee_id"
  add_foreign_key "internet_entries", "internet_accounts"
  add_foreign_key "internet_entries", "users", column: "attendee_id"
  add_foreign_key "taggings", "electricity_entries"
  add_foreign_key "taggings", "tags"
end
