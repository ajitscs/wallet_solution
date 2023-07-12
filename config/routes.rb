Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  
  # post '/api/transaction', to: 'transactions#create', namespace: "api"

  resources :users, only: [:new, :create]

  namespace :api do
    resources :transactions, only: :create
    post '/auth/login', to: 'authentication#login'
    get 'check_balance', to: 'wallets#show'
  end
end
