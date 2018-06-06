Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'

  root 'static_pages#home'

  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/registration'

  get 'roles/new'
  get 'roles/edit'
  get 'roles/index'

  get 'actors/new'
  get 'movies/new'

  resources :movies
  resources :actors
  resources :roles
  resources :users
  resources :sessions


  resource :movies do
    post '/search', to: 'movies#search'
  end

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
