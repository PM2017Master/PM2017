class StudentLecturesController < StudentBaseController
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
  	uploaded_file = student_lecture_param[:file]
    path_name = "public/files/#{DateTime.now.strftime("%Y%m%d%H%M%S")}#{uploaded_file.original_filename}"
    File.open(path_name, 'wb') { |f|
      f.write(uploaded_file.read)
    }
    StudentLecture.registe_lecture_data(1,path_name) #TODO:第一引数に現在ログインしている学生のID

  	redirect_to action: 'new'
  end

  private
  def student_lecture_param
  	params.require(:student_lecture).permit(:file)
  end
end
