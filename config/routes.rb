Rails.application.routes.draw do
  resources :cars
  resources :packages
  resources :users

  #Facebook Callback Route 
  get '/auth/facebook/callback' => 'sessions#create'
end
