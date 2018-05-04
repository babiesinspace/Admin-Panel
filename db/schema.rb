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

ActiveRecord::Schema.define(version: 2018_05_04_144644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "startdate"
    t.datetime "enddate"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_announcements_on_cohort_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.text "instructions"
    t.datetime "startdate"
    t.datetime "enddate"
    t.integer "grade"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_assignments_on_cohort_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.datetime "startdate"
    t.datetime "enddate"
    t.bigint "course_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_cohorts_on_course_id"
    t.index ["teacher_id"], name: "index_cohorts_on_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "hours"
    t.string "level"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "cohort_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_grades_on_cohort_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.integer "income"
    t.string "payable_type"
    t.bigint "payable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payable_type", "payable_id"], name: "index_salaries_on_payable_type_and_payable_id"
  end

  create_table "student_cohorts", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_student_cohorts_on_cohort_id"
    t.index ["student_id"], name: "index_student_cohorts_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first"
    t.string "last"
    t.integer "age"
    t.string "education"
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
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "student_cohorts", "cohorts"
  add_foreign_key "student_cohorts", "users", column: "student_id"
end
