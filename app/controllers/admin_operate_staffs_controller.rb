class AdminOperateStaffsController < AdminBaseController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.email.blank? #空
      @staff.errors[:email] << 'を入力してください'
      render :new
    elsif @staff.save
      redirect_to controller: :admin_operate_staffs, action: :index
    else
      render :new
    end
  end

  def destroy
    @staff.destroy
    redirect_to controller: :admin_operate_staffs, action: :index
  end

  private
  def staff_params
    params.require(:staff).permit(:email)
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end
end
