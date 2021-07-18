Rails.application.routes.draw do
  resources :movies, path: '/admin/movies' do
    collection do
      get 'search'
    end
  end
end
