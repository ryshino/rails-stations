Rails.application.routes.draw do

  resources :movies do
    resources :schedules do
      resources :sheets, only: [:index]
      resources :reservations, only: [:new]
    end
  end

  post 'reservations/', to: 'reservations#create'

  namespace :admin do
    resources :movies
    resources :schedules
  end
end
