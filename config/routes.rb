Rails.application.routes.draw do
  get 'roles/new'
  get 'roles/edit'
  get 'roles/index'

  resources :movies
  resources :actors
  resources :roles

  get 'actors/new'
  get 'movies/new'
  resource :movies do
    post '/search', to: 'movies#search'
  end

  get '/home', to: 'static_pages#home'

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
