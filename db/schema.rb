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

ActiveRecord::Schema.define(version: 20171122053832) do

  create_table "cancel_lectures", force: :cascade do |t|
    t.integer "teacher_lecture_id"
    t.date "cancel_date", null: false
    t.string "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_lecture_id"], name: "index_cancel_lectures_on_teacher_lecture_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "syllabus_code", null: false
    t.string "name", null: false
    t.string "semester", null: false
    t.string "year", null: false
    t.boolean "is_intensive", default: false
    t.string "day"
    t.integer "period"
    t.string "faculty", null: false
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["syllabus_code"], name: "index_lectures_on_syllabus_code", unique: true
  end

  create_table "no_lecture_dates", force: :cascade do |t|
    t.date "no_lecture_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "teacher_lecture_id"
    t.string "title"
    t.text "content"
    t.date "deadline_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_lecture_id"], name: "index_reports_on_teacher_lecture_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
  end

  create_table "student_lectures", force: :cascade do |t|
    t.integer "student_id"
    t.integer "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_student_lectures_on_lecture_id"
    t.index ["student_id"], name: "index_student_lectures_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "supplement_lectures", force: :cascade do |t|
    t.integer "teacher_lecture_id"
    t.date "supplement_date", null: false
    t.string "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_lecture_id"], name: "index_supplement_lectures_on_teacher_lecture_id"
  end

  create_table "teacher_lectures", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_teacher_lectures_on_lecture_id"
    t.index ["teacher_id"], name: "index_teacher_lectures_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
  end

end
