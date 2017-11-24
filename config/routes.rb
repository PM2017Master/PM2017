Rails.application.routes.draw do

  root 'welcom#home'


  
  #get 'student_base/rogin'
  #get 'teacher_base/rogin'
  #get 'staff_base/rogin'
  #get 'admin/rogin'

  get 'authorize' => 'auth#gettoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
