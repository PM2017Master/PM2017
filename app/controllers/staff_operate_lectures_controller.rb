class StaffOperateLecturesController < StaffBaseController
  #講義一覧表示画面
  def index
      @lectures = Lecture.all
  end

  #講義追加画面
  def new
  end

  #講義登録
  def create
    Lecture.import params[:file] #csv import実装
    redirect_to new_staff_operate_lecture_path
  end

  #講義検索
  def search
    @lectures = Lecture.search(params)
    render 'index'
  end

  #講義バックアップ
  def backup

  end

  def download
    generated_csv = Lecture.download
    send_data generated_csv.encode(Encoding::CP932, invalid: :replace, undef: :replace),
      filename: 'backup' + Time.now.to_s + '.csv',
      type: 'text/csv; charset=shift_jis'
      flash.now[:notice] = 'csvファイルのダウンロードが成功しました。'
  end

end
