class TeacherHomesController < TeacherBaseController
  #教員ホーム画面
  def index
    @lectures = Teacher.find_by(:email => session[:user_email]).lectures
    @cancel_lectures = Teacher.find_by(email: session[:user_email]).cancel_lectures
    @supplement_lectures = Teacher.find_by(email: session[:user_email]).supplement_lectures

  end
end
