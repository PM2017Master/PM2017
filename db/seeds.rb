# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者
Admin.find_or_create_by(id: 1) do |user|
    user.email = 'admin@admin'
    user.password = 'password'
  end

#学生
Student.create(email: "pmstudent2017@outlook.com")
Student.create(email: "pmstudent1@outlook.com")
Student.create(email: "pmstudent2@outlook.com")
Student.create(email: "pmstudent3@outlook.com")

#教員
Teacher.create(email: "pmteacher2017@outlook.com", name:"上田賀一")

#事務員
Staff.create(email: "pmstaff2017@outlook.com")

#講義
##一般講義
Lecture.create(
    syllabus_code: "T7538",
    name: "ソフトウェア工学Ⅰ",
    semester: "前期",
    year: "2017",
    day: "火",
    period: 2,
    faculty: "工学部",
    department: "情報工学科"
)
Lecture.create(
    syllabus_code: "T7501",
    name: "プログラミング演習Ⅰ",
    semester: "前期",
    year: "2017",
    day: "水",
    period: 3,
    faculty: "工学部",
    department: "情報工学科"
)

##集中講義
Lecture.create(
    syllabus_code: "T7585",
    name: "プロジェクトマネジメント論",
    semester: "後期", 
    year: "2017", 
    is_intensive: true,
    faculty: "工学部",
    department: "情報工学科"
)

#担当講義
TeacherLecture.create(
    teacher_id: Teacher.find_by(name: "上田賀一").id, 
    lecture_id: Lecture.find_by(name: "ソフトウェア工学Ⅰ").id
)
TeacherLecture.create(
    teacher_id: Teacher.find_by(name: "上田賀一").id, 
    lecture_id: Lecture.find_by(name: "プロジェクトマネジメント論").id
)

#履修講義
StudentLecture.create(
    student_id: Student.find_by(email: "pmstudent2017@outlook.com").id, 
    lecture_id: Lecture.find_by(name: "プロジェクトマネジメント論").id
)
StudentLecture.create(
    student_id: Student.find_by(email: "pmstudent1@outlook.com").id, 
    lecture_id: Lecture.find_by(name: "プロジェクトマネジメント論").id
)
StudentLecture.create(
    student_id: Student.find_by(email: "pmstudent2@outlook.com").id, 
    lecture_id: Lecture.find_by(name: "プロジェクトマネジメント論").id
)
StudentLecture.create(
    student_id: Student.find_by(email: "pmstudent3@outlook.com").id, 
    lecture_id: Lecture.find_by(name: "プロジェクトマネジメント論").id
)

#休講
@teacher_lecture = TeacherLecture.find_by(
    teacher_id: Teacher.find_by(name: "上田賀一").id, 
    lecture_id: Lecture.find_by(name: "ソフトウェア工学Ⅰ").id
)
CancelLecture.create(
    teacher_lecture_id: @teacher_lecture.id,
    cancel_date: Time.new(2017, 11, 30), 
    period: 2
)

#補講
SupplementLecture.create(
    teacher_lecture_id: @teacher_lecture.id,
    supplement_date: Time.new(2017, 11, 30),
    period: 2
)

#レポート
Report.create(
    teacher_lecture_id: @teacher_lecture.id,
    title: "レポート課題1",
    content: "ソフトウェアの設計",
    deadline_date: Time.new(2017, 11, 30),
)

#学年暦
AcademicCalendar.create(
    no_lecture_date: Time.new(2017, 11, 23)
)
