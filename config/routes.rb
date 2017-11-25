Rails.application.routes.draw do

  resources :admin_homes

  resources :admin_operate_staffs

  resources :admin_operate_teachers

  resources :admin_operate_admins

  resources :staff_academic_calendars

  resources :staff_operate_lectures

  resources :teacher_homes

  resources :stundet_homes

  resources :staff_homes

  resources :teacher_reports

  resources :teacher_lecture_dates

  resources :student_intensive_lectures

  resources :student_lectures


  root 'welcom#home'


  
  #get 'student_base/rogin'
  #get 'teacher_base/rogin'
  #get 'staff_base/rogin'
  #get 'admin/rogin'

  get 'authorize' => 'auth#gettoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
