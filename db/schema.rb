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

ActiveRecord::Schema[7.2].define(version: 2025_09_08_220346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "address1", null: false
    t.string "address2"
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_buildings_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_clients_on_name", unique: true
  end

  create_table "custom_enum_field_choices", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "custom_enum_field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_enum_field_id"], name: "index_custom_enum_field_choices_on_custom_enum_field_id"
  end

  create_table "custom_enum_field_values", force: :cascade do |t|
    t.bigint "custom_enum_field_choice_id", null: false
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_custom_enum_field_values_on_building_id"
    t.index ["custom_enum_field_choice_id"], name: "index_custom_enum_field_values_on_custom_enum_field_choice_id"
  end

  create_table "custom_enum_fields", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_custom_enum_fields_on_client_id"
  end

  create_table "custom_freeform_field_values", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "custom_freeform_field_id", null: false
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_custom_freeform_field_values_on_building_id"
    t.index ["custom_freeform_field_id"], name: "index_custom_freeform_field_values_on_custom_freeform_field_id"
  end

  create_table "custom_freeform_fields", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_custom_freeform_fields_on_client_id"
  end

  create_table "custom_number_field_values", force: :cascade do |t|
    t.decimal "value", null: false
    t.bigint "custom_number_field_id", null: false
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_custom_number_field_values_on_building_id"
    t.index ["custom_number_field_id"], name: "index_custom_number_field_values_on_custom_number_field_id"
  end

  create_table "custom_number_fields", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_custom_number_fields_on_client_id"
  end

  add_foreign_key "buildings", "clients"
  add_foreign_key "custom_enum_field_choices", "custom_enum_fields"
  add_foreign_key "custom_enum_field_values", "buildings"
  add_foreign_key "custom_enum_field_values", "custom_enum_field_choices"
  add_foreign_key "custom_enum_fields", "clients"
  add_foreign_key "custom_freeform_field_values", "buildings"
  add_foreign_key "custom_freeform_field_values", "custom_freeform_fields"
  add_foreign_key "custom_freeform_fields", "clients"
  add_foreign_key "custom_number_field_values", "buildings"
  add_foreign_key "custom_number_field_values", "custom_number_fields"
  add_foreign_key "custom_number_fields", "clients"
end
