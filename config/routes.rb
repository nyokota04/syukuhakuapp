Rails.application.routes.draw do
  # get 'reserves/index'
  # get 'reserves/new'
  # get 'reserves/creae'
  # get 'reserves/show'
  # get 'rooms/index'
  # get 'rooms/new'
  # get 'rooms/show'
  # get 'rooms/edit'
  # get 'home/index'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  root to: "home#index"
  devise_for :users
  resources :users
  resources :rooms
  post 'reserves/new', to: 'reserves#new'
  post 'reserves/create', to: 'reserves#create'
  resources :reserves
  get "search" => "searches#search"
end
