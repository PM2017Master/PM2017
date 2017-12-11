class AdminOperateTeachersController < AdminBaseController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def show
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if Teacher.exists?(email: @teacher.email) #既に存在
      if !@teacher.email.blank? #既に存在
        @teacher.errors[:email] << 'が既に登録されています'
      end
      render :new
    elsif @teacher.save
      lectures = Lecture.where(teacher_name: @teacher.name) #講義を教員名で検索
      lectures.each do |lecture|
        if lecture.teacher_lectures.empty? #中間テーブルに存在しないなら
          lecture.teachers << @teacher
        end
      end
      redirect_to controller: :admin_operate_teachers, action: :show, id: @teacher.id
    else
      render :new
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      redirect_to controller: :admin_operate_teachers, action: :index
      # 更新に成功したときの処理
    else
      redirect_to controller: :admin_operate_teachers, action: :edit, id: @teacher.id
    end
  end

  def destroy
    @teacher.destroy
    redirect_to controller: :admin_operate_teachers, action: :index
  end

private
  def teacher_params
    params.require(:teacher).permit(:email, :name)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

end
