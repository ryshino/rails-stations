Rails.application.routes.draw do
  resources :movies, path: '/admin/movies'
end
