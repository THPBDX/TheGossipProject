Rails.application.routes.draw do

  get '/', to: 'application#home'
  # post '/', to: 'message#show'

  get '/contact', to: 'contact#show'
  get '/team', to: 'team#show'

  get '/sessions/login', to: 'sessions#new_login'
  get '/sessions/sign_up', to: 'sessions#new_signup'

  post '/sessions/login', to: 'sessions#create_login'
  post '/sessions/sign_up', to: 'sessions#create_signup'

  #delete '/sessions/:id', to: 'sessions#destroy'
  #get '/sessions/:id', to: 'sessions#show'

resources :sessions
resources :users
resources :gossips
resources :comments
resources :subcomments
resources :likes
resources :cities

  end
