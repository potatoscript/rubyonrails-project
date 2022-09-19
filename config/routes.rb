Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    regisrations: 'users/registrations'
  }
  resources :jobs
  get 'home', to:'pages#home'
  get 'employee', to:'pages#employee'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
