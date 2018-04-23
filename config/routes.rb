Rails.application.routes.draw do
  resources :movies
  resources :actors
  resources :roles

  get 'actors/new'
  get 'movies/new'


  get '/home', to: 'static_pages#home'
  get '/movies', to: 'static_pages#movies'
  get '/actors', to: 'static_pages#actors'

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
