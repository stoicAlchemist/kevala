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

ActiveRecord::Schema[7.2].define(version: 2024_09_21_013850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "employee_position", ["rn", "lpn", "cna"]
  create_enum "shift_position", ["rn", "lpn", "cna"]

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.enum "position", null: false, enum_type: "employee_position"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_employees_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "starts_at", null: false
    t.string "ends_at"
    t.enum "position", null: false, enum_type: "shift_position"
    t.bigint "location_id", null: false
    t.bigint "assigned_employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_employee_id"], name: "index_shifts_on_assigned_employee_id"
    t.index ["location_id"], name: "index_shifts_on_location_id"
  end

  add_foreign_key "employees", "locations"
  add_foreign_key "shifts", "employees", column: "assigned_employee_id"
  add_foreign_key "shifts", "locations"
end
