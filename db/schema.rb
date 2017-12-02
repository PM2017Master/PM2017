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

ActiveRecord::Schema.define(version: 20171130035717) do

  create_table "academic_calendars", force: :cascade do |t|
    t.date "no_lecture_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date_name"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cancel_lectures", force: :cascade do |t|
    t.integer "TeacherLecture_id"
    t.date "cancel_date", null: false
    t.string "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["TeacherLecture_id"], name: "index_cancel_lectures_on_TeacherLecture_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "syllabus_code", null: false
    t.string "name", null: false
    t.string "semester", null: false
    t.string "year", null: false
    t.boolean "is_intensive", default: false
    t.string "day"
    t.integer "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teacher_name"
    t.index ["syllabus_code"], name: "index_lectures_on_syllabus_code", unique: true
  end

  create_table "no_lecture_dates", force: :cascade do |t|
    t.date "no_lecture_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "TeacherLecture_id"
    t.string "title"
    t.text "content"
    t.date "deadline_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["TeacherLecture_id"], name: "index_reports_on_TeacherLecture_id"
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
  end

  create_table "student_lectures", force: :cascade do |t|
    t.integer "Student_id"
    t.integer "Lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Lecture_id"], name: "index_student_lectures_on_Lecture_id"
    t.index ["Student_id"], name: "index_student_lectures_on_Student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "azure_token"
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "supplement_lectures", force: :cascade do |t|
    t.integer "TeacherLecture_id"
    t.date "supplement_date", null: false
    t.string "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["TeacherLecture_id"], name: "index_supplement_lectures_on_TeacherLecture_id"
  end

  create_table "teacher_lectures", force: :cascade do |t|
    t.integer "Teacher_id"
    t.integer "Lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Lecture_id"], name: "index_teacher_lectures_on_Lecture_id"
    t.index ["Teacher_id"], name: "index_teacher_lectures_on_Teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
