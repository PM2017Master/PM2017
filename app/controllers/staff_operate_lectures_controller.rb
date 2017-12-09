class StaffOperateLecturesController < StaffBaseController
  #講義一覧表示画面
  def index
      @lectures = Lecture.page(params[:page])
  end

  #講義追加画面
  def new
  end

  #講義登録
  def create
    if Lecture.import params[:file] #csv import実装
    lectures = Lecture.all
    lectures.each do |lecture|
      if Teacher.exists?(:name => lecture.teacher_name )
        t_id = Teacher.find_by(:name => lecture.teacher_name).id
        TeacherLecture.create(teacher_id: t_id,lecture_id:lecture.id)
      end
    end
      redirect_to staff_operate_lectures_path,:notice => '講義の登録に成功しました。'
    else
      redirect_to new_staff_operate_lecture_path,:alert => 'ファイル形式が不正です。csvファイルをアップロードしてください。'
    end
  end

  #講義検索
  def search
    @lectures = Lecture.search(params).page(params[:page])
    @lectures = Lecture.research(params).page(params[:page]) if @lectures.count == 0
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
