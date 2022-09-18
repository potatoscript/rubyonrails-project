Rails.application.routes.draw do
  resources :jobs
  get 'home', to:'pages#home'
  get 'employee', to:'pages#employee'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
