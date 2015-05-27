
Rails.application.routes.draw do

  root 'users#index'

  resources :weddings do
    resources :guests
    resources :registries
    resources :foods
    resources :events do
      resources :containers
    end
  end

  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


end
