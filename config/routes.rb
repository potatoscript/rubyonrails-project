Rails.application.routes.draw do

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    regisrations: 'users/registrations'
  }
  get '/u/:id', to: 'users#profile', as: 'user'
  get 'users', to: 'users#index'
  
  # /jobs/1/comments/4
  resources :jobs do
    resource :comments
  end

  get 'home', to:'pages#home'
  get 'about', to:'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"


  
end
