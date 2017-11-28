Rails.application.routes.draw do

  devise_for :admins , :controllers => {
    #as :admin do
      :sessions      => "admins/sessions",
      :registrations => "admins/registrations",
      :passwords     => "admins/passwords",
      #admins
    } 
  
  devise_scope :admin do
    get 'admins/edit' => 'admins/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'admins/registrations#update', :as => 'admin_registration'
  end
  resources :admin_homes, only: [:index]
  #resources
  #admin
  resources :admin_operate_staffs, only: [:index, :new, :create, :destroy]

  resources :admin_operate_teachers,only: [:index, :new, :edit, :create, :destroy]

  resources :admin_operate_admins

  #staff
  resources :staff_academic_calendars,only: [:index, :new, :create, :destroy]

  resources :staff_operate_lectures,only: [:index, :new, :create] do
  collection do
    get :search
    get :backup
  end
end

  resources :staff_homes,only: [:index]

  #teacher
  resources :teacher_homes,only: [:index]

  resources :teacher_reports,only: [:index, :new, :create, :destroy]

  resources :teacher_lecture_dates,only: [:new, :create]

  #student
  resources :student_homes,only: [:index]

  resources :student_intensive_lectures,only: [:index, :new, :create, :destroy]
  get 'student_lectures' => 'student_lectures#new'
  resources :student_lectures,only: [:new, :create]

  
  root 'welcom#home'


  get 'authorize' => 'auth#gettoken'
  get 'student_homes/index'
  get 'staff_homes/index'
  get 'teacher_homes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login' => 'welcom#home'

  get "system_emails" => "system_emails#sendmail" 
  get "system_calendars" => "system_calendars#sendcalendar"
end
  