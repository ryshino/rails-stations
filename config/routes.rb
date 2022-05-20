Rails.application.routes.draw do
  #root 'movies#index'
  root 'rankings#movie_reservation_ranking'
  
  devise_for :users
  
  devise_scope :user do
    get 'users/new', to: 'devise/registrations#new'
  end

  resources :users, only: [:show]
  
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }

  devise_scope :admin_user do
    get '/admin_users/sign_out' => 'devise/sessions#destroy'
  end

  resources :movies do
    resources :schedules do
      resources :sheets, only: [:index]
      resources :reservations, only: [:new,]
    end
  end

  post 'reservations/', to: 'reservations#create'
  get '/admin/movies/screen_select' => 'admin/movies#screen_select'


  namespace :admin do
    resources :movies
    resources :schedules
    resources :reservations, only: [:index, :new, :create, :show, :update, :destroy]
  end
end
