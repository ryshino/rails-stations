Rails.application.routes.draw do
  get 'admin/movies', to: 'movies#index'
end
