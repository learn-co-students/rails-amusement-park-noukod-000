Rails.application.routes.draw do
  resources :users, only:[:index,:new,:create,:show]
  root 'application#home'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create', as: 'login'
end
