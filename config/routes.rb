Rails.application.routes.draw do
  resources :users, :only =>[:index,:new,:create,:show]
  resources :attractions, :only =>[:index,:show,:new,:create,:edit,:update]
  resources :rides, :only => [:create]
  root 'application#home'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create', :as=> 'login'
  get 'logout' => 'sessions#logout',:as=> 'logout'
end
