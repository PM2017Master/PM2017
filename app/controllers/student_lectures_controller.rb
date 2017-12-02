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
  	output_path = Rails.root.join('public', uploaded_file.original_filename)
  	
  	File.open(output_path, 'w+b') do |fp|
  		fp.write uploaded_file.read
  	end
  	
  	redirect_to action: 'new'
  end
  
  private
  def student_lecture_param
  	params.require(:student_lecture).permit(:file)
  end
end
