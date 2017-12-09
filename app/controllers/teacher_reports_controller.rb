class TeacherReportsController < TeacherBaseController
  #レポート一覧
  def index
    @reports = Report.all
  end

  #レポート登録画面
  def new
    @report = Report.new
    @lectures = Teacher.find_by(:email => session[:user_email]).lectures
    # = TeacherLecture.where(:teacher_id => id)
  end

  #レポートDBに追加
  def create
    lecture = report_params[:lecture]
    title = report_params[:title]
    content = report_params[:content]
    deadline_date = report_params[:deadline_date]
    @report = Report.create(teacher_lecture_id: get_teacher_lecture_id, title: title, content: content, deadline_date: deadline_date)
    #lecture=report_params.lecture
    if @report.valid?
      @report.save!
      redirect_to teacher_reports_path, :notice => 'レポートの登録が完了しました。'
    else
      redirect_to new_teacher_report_path, :alert =>'レポートの登録に失敗しました。入力値を確認してください！'
    end
  end

  #レポートDBから削除
  def destroy
  end

  private
  def report_params
    params
      .require(:report)
      .permit(:lecture, :title, :content, :deadline_date)
  end

  def get_teacher_lecture_id
    get_teacher = Teacher.find_by(:email => session[:user_email])
    get_lecture = get_teacher.lectures.find_by(:name => report_params[:lecture])
    if get_teacher.present? && get_lecture.present?
      need_data = TeacherLecture.find_by(:Teacher_id => get_teacher.id, :Lecture_id => get_lecture.id)
      need_data.id
    end
  end

end
