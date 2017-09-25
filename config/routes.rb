Rails.application.routes.draw do
  root 'dashboard#show'

  get '/auth/:provider/callback', to: 'logins#create'
  get '/auth/failure', to: redirect('/')

  resource :login, only: [:show]
  resource :logout, only: [:show]

  resources :exams
  resources :openings, only: [:index] do
    post 'sync', on: :collection
  end
  resources :users, only: [:index]
end
