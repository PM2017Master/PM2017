class TeacherReportsController < TeacherBaseController
  #レポート一覧
  def index
  end

  #レポート登録画面
  def new
    @report = Report.new
  end

  #レポートDBに追加
  def create
    @report = Report.new(report_params)
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
      .require(:form_report)
      .permit(:title, :content, :deadline_date)
  end
end
