# suzuki create
class StaffAcademicCalendarsController < StaffBaseController
  #学年暦一覧表示
  def index
    @calendars = AcademicCalendar.all
  end

  #学年暦登録画面
  def new
    @calendars = AcademicCalendar.new
  end

  #学年暦DB登録
  def create
    @calendars.no_lecture_date = params[:date]
    @calendars.save
  end

  #学年暦DBから削除
  def destroy
  end
end
