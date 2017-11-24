Rails.application.routes.draw do

  get 'admin_operate_staffs/index'

  get 'admin_operate_staffs/new'

  get 'admin_operate_teachers/index'

  get 'admin_operate_teachers/new'

  get 'admin_operate_teachers/show'

  get 'admin_operate_teachers/edit'

  get 'admin_operate_admins/edit'

  get 'staff_academic_calendars/index'

  get 'staff_academic_calendars/new'

  get 'staff_operate_lectures/index'

  get 'staff_operate_lectures/new'

  get 'teacher_homes/index'

  get 'student_homes/index'

  get 'staff_homes/index'

  get 'staffs/index'

  get 'staffs/create'

  get 'teacher_reports/index'

  get 'teacher_reports/new'

  get 'teacher_lecture_dates/new'

  get 'teachers/index'

  get 'student_intensive_lectures/index'

  get 'student_intensive_lectures/new'

  get 'student_lectures/new'

  get 'students/index'

  get 'student_lecture/new'

  get 'student/index'

  root 'welcom#home'


  
  #get 'student_base/rogin'
  #get 'teacher_base/rogin'
  #get 'staff_base/rogin'
  #get 'admin/rogin'

  get 'authorize' => 'auth#gettoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
