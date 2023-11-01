Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  resources :tweets
  resources :users
  post 'top/login'
  get 'top/main'
  post 'users/new'
  get 'top/logout'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
