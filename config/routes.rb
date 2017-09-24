Rails.application.routes.draw do
  root 'dashboard#show'

  get '/auth/:provider/callback', to: 'logins#create'
  get '/auth/failure', to: redirect('/')

  resource :login, only: [:show]
  resource :logout, only: [:show]

  resources :users, only: [:index]
end
