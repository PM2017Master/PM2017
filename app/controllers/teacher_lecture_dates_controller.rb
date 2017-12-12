class TeacherLectureDatesController < TeacherBaseController
  include SystemCalendarsHelper
  include SystemEmailsHelper

  #開講日変更登録画面
  def new
    @lectures = Teacher.find_by(:email => session[:user_email]).lectures
    @date = CancelLecture.new
  end

  #DBに追加
  def create
    if date_params[:cancel_date_previous_change] == "休講"
      if SupplementLecture.where(teacher_lecture_id: get_teacher_lecture_id).where(supplement_date: date_params[:cancel_date]).where(period: date_params[:period]).count <=0
        @cancel_lectures = CancelLecture.create(teacher_lecture_id: get_teacher_lecture_id, cancel_date: date_params[:cancel_date], period: date_params[:period])
        if @cancel_lectures.valid?
          @cancel_lectures.save!
          calendar(date_params[:cancel_date_previous_change], date_params[:lecture], date_params[:cancel_date])
          #sendmail_lecture(date_params[:cancel_date_previous_change], date_params[:lecture], date_params[:cancel_date], date_params[:period])
          SendemailJob.perform_later(date_params[:cancel_date_previous_change], date_params[:lecture], date_params[:cancel_date], date_params[:period])
          redirect_to teacher_homes_path, :notice => '休講の登録が完了しました。'
        else
          redirect_to new_teacher_lecture_date_path, :alert =>'休講の登録に失敗しました。入力値を確認してください！'
        end
      else
        #SupplementLecture.destroy_all.(teacher_lecture_id: get_teacher_lecture_id, supplement_date: date_params[:cancel_date], period: date_params[:period])
        SupplementLecture.where(teacher_lecture_id: get_teacher_lecture_id).where(supplement_date: date_params[:cancel_date]).where(period: date_params[:period]).destroy_all
        redirect_to teacher_homes_path, :notice => '補講の削除が完了しました。'
      end
    else
      if CancelLecture.where(teacher_lecture_id: get_teacher_lecture_id).where(cancel_date: date_params[:cancel_date]).where(period: date_params[:period]).count <=0
        if AcademicCalendar.where(no_lecture_date: date_params[:cancel_date]).count <= 0 && Date.strptime(date_params[:cancel_date], '%Y/%m/%d').wday != 0
          @supplement_lectures = SupplementLecture.create(teacher_lecture_id: get_teacher_lecture_id, supplement_date: date_params[:cancel_date], period: date_params[:period])
          if @supplement_lectures.valid?
            @supplement_lectures.save!
            calendar(date_params[:cancel_date_previous_change], date_params[:lecture], date_params[:cancel_date])
            #sendmail_lecture(date_params[:cancel_date_previous_change], date_params[:lecture], date_params[:cancel_date], date_params[:period])
            SendemailJob.perform_later(date_params[:cancel_date_previous_change], date_params[:lecture], date_params[:cancel_date], date_params[:period])
            redirect_to teacher_homes_path, :notice => '補講の登録が完了しました。'
          else
            redirect_to new_teacher_lecture_date_path, :alert =>'補講の登録に失敗しました。入力値を確認してください！'
          end
        else
          redirect_to new_teacher_lecture_date_path, :alert =>'その日に補講は登録できません。'
        end
      else
        #CancelLecture.destroy_all.(teacher_lecture_id: get_teacher_lecture_id, cancel_date: date_params[:cancel_date], period: date_params[:period])
        CancelLecture.where(teacher_lecture_id: get_teacher_lecture_id).where(cancel_date: date_params[:cancel_date]).where(period: date_params[:period]).destroy_all
        redirect_to teacher_homes_path, :notice => '休講の削除が完了しました。'
      end
    end
  end

  private
  def date_params
    params
      .require(:cancel_lecture)
      .permit(:lecture, :cancel_date_previous_change, :cancel_date, :period)
  end

  def get_teacher_lecture_id
    get_teacher = Teacher.find_by(:email => session[:user_email])
    get_lecture = get_teacher.lectures.find_by(:name => date_params[:lecture])
    if get_teacher.present? && get_lecture.present?
      need_data = TeacherLecture.find_by(:Teacher_id => get_teacher.id, :Lecture_id => get_lecture.id)
      need_data.id
    end
  end

end
