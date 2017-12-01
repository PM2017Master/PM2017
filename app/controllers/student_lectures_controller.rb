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
  end
end
