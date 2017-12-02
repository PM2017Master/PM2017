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
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  resources :admin_homes, only: [:index]
  #resources
  #admin
  resources :admin_operate_staffs, only: [:index, :new, :create, :destroy]

  resources :admin_operate_teachers

  resources :admin_operate_admins

  #staff
  resources :staff_academic_calendars,only: [:index, :new, :create, :destroy]

  resources :staff_operate_lectures,only: [:index, :new, :create] do
  collection do
    get :search
    get :backup
    post :download
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
  get 'student_lectures/download_excel' => 'student_lectures#download_excel'
  resources :student_lectures,only: [:new, :create]


  root 'welcom#home'


  get 'authorize' => 'auth#gettoken'
  get 'student_homes/index'
  get 'staff_homes/index'
  get 'teacher_homes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  get "system_calendars" => "system_calendars#calendar"

  get "system_calendars" => "system_calendars#sendcalendar"

  get "system_emails" => "system_emails#sendmail_lecture"
  get "system_emails" => "system_emails#sendmail_report"

end
