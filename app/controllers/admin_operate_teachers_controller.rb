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

    if Teacher.exists?(email: @teacher.email)
      p @teacher.email
      if !@teacher.email.blank? #既に存在
        @teacher.errors[:email] << '教員メールアドレスが既に登録されています'
      elsif #空
        @teacher.errors[:email] << '教員メールアドレスを入力してください'
      end
      render :new
    elsif @teacher.save
      redirect_to controller: :admin_operate_teachers, action: :show, id: @teacher.id
    else
      render :new
    end
  end

  def update
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
