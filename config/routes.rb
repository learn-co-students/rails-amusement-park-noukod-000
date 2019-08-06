Rails.application.routes.draw do

  resources :attractions
  resources :users, only: [:show,:new, :create]

  get '/signin' => 'sessions#signin', as: 'signin_session'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout_session'

  post 'rides/new' => 'rides#create', as: 'new_ride'

  root 'application#home'
end
