#講義
##一般講義
l1 = Lecture.create(
    syllabus_code: "T7538",
    name: "ソフトウェア工学Ⅰ",
    semester: "前期",
    year: "2017",
    day: "火",
    period: 2,
    faculty: "工学部",
    department: "情報工学科",
    teacher_name: "上田賀一"
)
l2 = Lecture.create(
    syllabus_code: "T7501",
    name: "プログラミング演習Ⅰ",
    semester: "前期",
    year: "2017",
    day: "水",
    period: 3,
    faculty: "工学部",
    department: "情報工学科",
    teacher_name: "岡田信一郎"
)

##集中講義
l3 = Lecture.create(
    syllabus_code: "T7585",
    name: "プロジェクトマネジメント論",
    semester: "後期",
    year: "2017",
    is_intensive: true,
    faculty: "工学部",
    department: "情報工学科",
    teacher_name: "上田賀一"
)

t1 = Teacher.new(email: "pmteacher2017@outlook.com", name:"上田賀一")
t2 = Teacher.new(email: "pmteacher@outlook.com", name:"岡田信一郎")

#担当講義
l2.teachers << t2
#l3.teachers << t1

#履修講義
after :people do
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
@teacher_lecture = TeacherLecture.find(1)

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

end

#学年暦
AcademicCalendar.create(
    no_lecture_date: Time.new(2017, 11, 23)
)
