class StudentHomesController < StudentBaseController
  def index
    intensive_lectures = Lecture.where(is_intensive: true)
  	#student = Student.find_by(email: session[:email])
  	student_lectures = StudentLecture.where(student_id: 3)#student.id)
	  @student_intensive_lectures = []

  	intensive_lectures.each do |intensive_lecture|
		  student_lectures.each do |student_lecture|
		  	if(intensive_lecture.id == student_lecture.lecture_id)
		  		@student_intensive_lectures.push(intensive_lecture)
		  	end
		  end
	  end
  end

end
