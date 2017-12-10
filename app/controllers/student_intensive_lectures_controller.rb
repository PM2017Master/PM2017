class StudentIntensiveLecturesController < StudentBaseController
  #集中講義一覧表示画面
  def index
  	if params[:faculty] || params[:department] || params[:search_word]
  		@intensive_lectures = Lecture.where(is_intensive: true)
  		.where('faculty LIKE ?', "%#{params[:faculty]}%")
  		.where('department LIKE ?', "%#{params[:department]}%")
  		.where('name LIKE ?', "%#{params[:search_word]}%")
  	else
	  	@intensive_lectures = Lecture.where(is_intensive: true)
  	end
  	
  end
  
  #集中講義登録画面
	def new
		student = Student.find_by(email: session[:user_email])
		resistLecture = StudentLecture.new
		resistLecture.student_id = student.id
		resistLecture.lecture_id = Lecture.find_by(name: params[:selected_lecture]).id
		
		student_lectures = StudentLecture.where(student_id: student.id)
		duplication = false
		student_lectures.each do |student_lecture|
			if (resistLecture.student_id == student_lecture.student_id) &&
				(resistLecture.lecture_id == student_lecture.lecture_id)
				duplication = true
			end
		end

		unless duplication
			resistLecture.save
		end
  end

  #講義DBに追加
  def create
  	if params[:selected_lecture]
	  	@selected_lecture = params[:selected_lecture]
		else
			@selected_lecture = 0
		end
  end

  #講義DBから削除
  def destroy
  end
  
  def deleteindex
  	intensive_lectures = Lecture.where(is_intensive: true)
  	student = Student.find_by(email: session[:user_email])
  	student_lectures = StudentLecture.where(student_id: student.id)
		@student_intensive_lectures = []
	
		intensive_lectures.each do |intensive_lecture|
			student_lectures.each do |student_lecture|
				if(intensive_lecture.id == student_lecture.lecture_id)
					@student_intensive_lectures.push(intensive_lecture)
				end
			end
		end
	
		render "student_intensive_lectures/deleteindex"
  end
  
  def deleteconfirm
    if params[:selected_lecture]
	  	@selected_lecture = params[:selected_lecture]
		else
			@selected_lecture = 0
		end
		render "student_intensive_lectures/deleteconfirm"
  end
  
    #講義DBから削除
  def delete
		student = Student.find_by(email: session[:user_email])
  	deleteLecture = StudentLecture.find_by(student_id: student.id,
  	lecture_id: Lecture.find_by(name: params[:selected_lecture]).id).destroy
  end
end
