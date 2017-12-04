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
  end

  #講義DBに追加
  def create
  end

  #講義DBから削除
  def destroy
  end
end
