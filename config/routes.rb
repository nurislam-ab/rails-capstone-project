Rails.application.routes.draw do
  resources :categories
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  
  resources :users

  delete '/logout', to: 'sessions#destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/users', to: 'users#index'

  root 'articles#index'
end
