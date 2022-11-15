Rails.application.routes.draw do
  devise_for :users
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "projects#index"
  resources :projects
  # Defines the root path route ("/")
  # root "articles#index"
end
