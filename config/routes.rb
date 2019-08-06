# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/update-user', to: 'users#update'
    end
  end
end
