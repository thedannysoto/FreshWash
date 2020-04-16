Rails.application.routes.draw do
  resources :cars do 
    resources :packages, only: [:new, :create]
  end
  
  resources :users
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login'

  resources :washes, only: [:index]

  resources :sessions, only: [:index, :create, :destroy]
  post '/logout', to: 'sessions#destroy'

  #Set Root
  root 'sessions#index'

  #Facebook Callback Route 
  get '/auth/facebook/callback' => 'sessions#create'
end
