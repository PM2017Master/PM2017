#学生
Student.create(email: "pmstudent2017@outlook.com")
Student.create(email: "pmstudent1@outlook.com")
Student.create(email: "pmstudent2@outlook.com")
Student.create(email: "pmstudent3@outlook.com")

#教員
t1 = Teacher.new(email: "pmteacher2017@outlook.com", name:"上田賀一")
t2 = Teacher.new(email: "pmteacher@outlook.com", name:"岡田信一郎")

t1.save
t2.save

#事務員
Staff.create(email: "pmstaff2017@outlook.jp")
