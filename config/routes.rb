Rails.application.routes.draw do

  resources :users
  resources :attractions
  resources :rides
  
  # get 'users/new'
end
