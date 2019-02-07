Rails.application.routes.draw do

  get '/', to: 'message#show'
  post '/', to: 'message#show'

  get '/contact', to: 'contact#show'
get '/team', to: 'team#show'

resources :sessions

resources :users
resources :gossips
resources :comments
resources :subcomments
resources :likes

  end
