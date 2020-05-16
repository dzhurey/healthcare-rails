# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_154923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.bigint "schedule_line_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_line_id"], name: "index_bookings_on_schedule_line_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name", null: false
    t.string "speciality", default: "General", null: false
    t.text "about", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "address", default: "", null: false
    t.text "about", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedule_lines", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.integer "day_of_week", null: false
    t.time "start", null: false
    t.time "end", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_schedule_lines_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_schedules_on_doctor_id"
    t.index ["hospital_id"], name: "index_schedules_on_hospital_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'user_notification_role' for column 'role'

  add_foreign_key "bookings", "schedule_lines"
  add_foreign_key "bookings", "users"
  add_foreign_key "schedule_lines", "schedules"
  add_foreign_key "schedules", "doctors"
  add_foreign_key "schedules", "hospitals"
end
