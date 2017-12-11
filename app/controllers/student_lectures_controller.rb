class StudentLecturesController < StudentBaseController
  require "fileutils"

  #登録画面
  def new
  end

  def download_excel
  	file_name="講義登録_テンプレート.xlsx"
  	filepath = Rails.root.join('public', file_name);
  	stat = File::stat(filepath)
  	send_file(filepath, :filename => file_name, :length => stat.size)
  end

  #講義DBに登録
  def create
    Dir.chdir Rails.root
    student = Student.find_by(email: session[:user_email])

    uploaded_file = student_lecture_param[:file]
    path_name = "public/files/#{DateTime.now.strftime("%Y%m%d%H%M%S")}#{uploaded_file.original_filename}"
    File.open(path_name, 'wb') { |f|
      f.write(uploaded_file.read)
    }
    
    unless File.extname(uploaded_file.original_filename) == ".xlsx"
      redirect_to action: 'error'
    else
      student_lectures = StudentLecture.where(student_id: student.id)
      student_lectures.each do |student_lecture|
        if Lecture.find_by(id: student_lecture.lecture_id).is_intensive == false
          student_lecture.destroy
        end
      end

      @candidate_lectures = []
      @not_exist_lectures = StudentLecture.registe_lecture_data(student.id ,path_name)
      @not_exist_lectures.each do |not_exists_lecture|
        if not_exists_lecture.nil?
          next
        end
        temp_candidate_lectures = Lecture.where('name LIKE ?', "%#{not_exists_lecture}%")
        unless temp_candidate_lectures.empty?
          @candidate_lectures.push(temp_candidate_lectures)
        end
      end
    end
  end

  def complete
    @error = false
    student = Student.find_by(email: session[:user_email])
    if params[:selected_lectures]
      @selected_lectures = params[:selected_lectures]
      @selected_lectures.each do |selected_lecture|
        unless Lecture.find_by(name: selected_lecture).nil?
          l_id = Lecture.find_by(name: selected_lecture).id
          obj = StudentLecture.new
          obj.student_id = student.id
          obj.lecture_id = l_id
          obj.save
        end
      end
    else
      @error = true
    end

    Dir.chdir Rails.root.join('public').join('files')
    FileUtils.rm(Dir.glob('*.*'))  
    Dir.chdir Rails.root
  end

  def error
    render "student_lectures/error"
  end

  private
  def student_lecture_param
  	params.require(:student_lecture).permit(:file)
  end
end
