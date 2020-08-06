# frozen_string_literal: true

# Class documentation comment

Rails.application.routes.draw do
  resources :categories
  resources :articles do
    resources :votes, only: %i[create destroy]
  end

  resources :users

  delete '/logout', to: 'sessions#destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/users', to: 'users#index'

  get 'dashboard/articles', to: 'admin_dashboard#articles_list', as: :articles_admin

  get 'dashboard/categories', to: 'admin_dashboard#categories_list', as: :categories_admin

  get 'dashboard/users', to: 'admin_dashboard#users_list', as: :users_admin

  get 'dashboard/votes', to: 'admin_dashboard#votes_list', as: :votes_admin

  root 'home#index'
end
