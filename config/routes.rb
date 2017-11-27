Rails.application.routes.draw do

  devise_for :admins
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
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
  resources :stundet_homes,only: [:index]

  resources :student_intensive_lectures,only: [:index, :new, :create, :destroy]

  resources :student_lectures,only: [:new, :create]


  root 'welcom#home'


  get 'authorize' => 'auth#gettoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
