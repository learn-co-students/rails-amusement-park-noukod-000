Rails.application.routes.draw do
  resources :users,only:[:index,:show,:create,:new,:update]
  resources :attractions,only:[:index,:show,:new,:create,:edit,:update]
  resources :rides,only:[:index,:show,:new,:update,:create]

  get "/signin",to:"sessions#signin"
  post "/signin",to:"sessions#create"
  get "/logout",to:"sessions#destroy"

  root "welcome#index"

end
