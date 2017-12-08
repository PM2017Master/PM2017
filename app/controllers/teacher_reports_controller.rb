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
    teacher_lecture = Teacher.find_by(:email => session[:user_email]).lectures.find_by(name: report_params[:lecture]).teacher_lectures
    @report = Report.create(teacher_lecture_id: teacher_lecture.ids, title: title, content: content, deadline_date: deadline_date)
    #lecture=report_params.lecture
    if @report.valid?
      @report.save
      redirect_to teacher_reports_path, :notice => 'レポートの登録が完了しました。'
    else
      render :new
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
end
