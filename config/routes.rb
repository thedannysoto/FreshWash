Rails.application.routes.draw do
  resources :cars
  resources :packages
  resources :users

  #Set Root
  root 'sessions#index'

  #Facebook Callback Route 
  get '/auth/facebook/callback' => 'sessions#create'
end
