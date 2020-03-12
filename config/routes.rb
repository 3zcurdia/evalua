# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :pull_request_evaluations, except: %i[index show destroy]
  resources :repository_evaluations, except: %i[index show destroy]
  resources :evaluations, only: %i[index show destroy]
  resources :rubrics

  root 'home#index'
end
