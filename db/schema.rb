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

ActiveRecord::Schema.define(version: 20171122042946) do

  create_table "academic_canledars", force: :cascade do |t|
    t.date "no_lecture_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
