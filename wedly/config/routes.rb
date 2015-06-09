
Rails.application.routes.draw do

  root 'users#index'

  resources :weddings do
    resources :invitations, only: [:index, :new, :create]
    resources :guests
    resources :registries
    resources :foods
    resources :playlists do
      resources :songs
    end
    resources :comments, only: [:show, :create, :destroy]
    resources :events do
      resources :containers
    end
  end

  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'users/signup/:token' => 'users#new', :as => :signup

end