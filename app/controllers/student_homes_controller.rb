class StudentHomesController < StudentBaseController
	def index
		@student_email = session[:user_email]
  	student = Student.find_by(email: session[:user_email])
		temp_student_lectures = StudentLecture.where(student_id: student.id)

		@student_lectures = []
		temp_student_lectures.each do |student_lecture|
			unless Lecture.find_by(id: student_lecture.lecture_id).is_intensive == true
				@student_lectures.push(Lecture.find_by(id: student_lecture.lecture_id))
			end
		end

	  @student_intensive_lectures = []
		temp_student_lectures.each do |student_lecture|
			if Lecture.find_by(id: student_lecture.lecture_id).is_intensive == true
				@student_intensive_lectures.push(Lecture.find_by(id: student_lecture.lecture_id))
			end
		end

  end

end
