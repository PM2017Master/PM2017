class TeacherLectureDatesController < TeacherBaseController
  #開講日変更登録画面
  def new
    @lectures = Teacher.find_by(:email => session[:user_email]).lectures
    @date =
  end

  #DBに追加
  def create
  end
end
