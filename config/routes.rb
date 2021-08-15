Rails.application.routes.draw do
  resources :movies, path: '/admin/movies'
  resources :schedules, path: '/admin/schedules'
  resources :sheets
end
