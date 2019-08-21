Rails.application.routes.draw do
  
  #resources :attractions
  resources :users
  get 'session/login' => 'sessions#create'
  root 'users#new'
end
