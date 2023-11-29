Rails.application.routes.draw do

 
  patch 'employees/update_password', to: "employees#update_password"

  get 'employees/subordinates', to: "employees#subordinates"
  get 'employees/manager', to: "employees#manager"
  get 'employees/participated_meetings', to: "employees#participated_meetings"
  get 'employees/created_meetings', to: "employees#created_meetings"

  devise_for :employees, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout'
   
    },
    controllers: {
      sessions: 'employees/sessions'
   
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  resources :employees, only: [:index, :create, :update, :destroy]
  resources :meets, only: [ :create, :update, :destroy]
end
