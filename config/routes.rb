Rails.application.routes.draw do
  #root 'movies#index'
  root 'rankings#movie_reservation_ranking'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get 'users/new', to: 'devise/registrations#new'
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  resources :users, only: [:show]
  
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }

  devise_scope :admin_user do
    get '/admin_users/sign_out', to: 'admin_users/sessions#destroy'
  end

  get '/movies/schedule_select' => 'movies#schedule_select'
  
  resources :movies do
    resources :reviews
    resources :schedules do
      resources :sheets, only: [:index]
      resources :reservations, only: [:new]
    end
  end

  post 'reservations/', to: 'reservations#create'
  get '/admin/movies/screen_select' => 'admin/movies#screen_select'

  get '/admin' => 'admin/movies#index'
  namespace :admin do
    resources :movies do
      resources :reviews, only: [:index, :destroy]
    end
    resources :schedules
    resources :reservations, only: [:index, :new, :create, :show, :update, :destroy]
    resources :users, only: [:index, :destroy]
  end
end
