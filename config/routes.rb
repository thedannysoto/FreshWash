Rails.application.routes.draw do
  resources :cars do 
    resources :packages
  end
  
  resources :users
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login'

  #Set Root
  root 'sessions#index'

  #Facebook Callback Route 
  get '/auth/facebook/callback' => 'sessions#create'
end
