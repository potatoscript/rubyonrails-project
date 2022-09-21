Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    regisrations: 'users/registrations'
  }
  get '/u/:id', to: 'users#profile', as: 'user'
  
  # /jobs/1/comments/4
  resources :jobs do
    resource :comments
  end

  get 'home', to:'pages#home'
  get 'employee', to:'pages#employee'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
