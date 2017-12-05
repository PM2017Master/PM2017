# suzuki create
class StaffAcademicCalendarsController < StaffBaseController
  #学年暦一覧表示
  def index
    @calendars = AcademicCalendar.page(params[:page])
  end

  #学年暦登録画面
  def new
    @calendar = AcademicCalendar.new
  end

  #学年暦DB登録
  def create
      @calendar = AcademicCalendar.new(calendar_params)
    if @calendar.valid?
        @calendar.save
        redirect_to staff_academic_calendars_path,:notice => '学年暦の登録ができました。'
      else
        render :new
      end
  end

  #学年暦DBから削除
  def destroy
    AcademicCalendar.delete(params[:id])
    redirect_to staff_academic_calendars_path,:alert => '学年暦を削除しました。'
  end

  private
  def calendar_params
    params.require(:academic_calendar).permit(:no_lecture_date, :date_name)
  end
end
