# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  namespace :evaluations do
    resources :pull_requests, except: :destroy
    resources :repositories, except: :destroy
  end
  resources :evaluations, only: %i[index show destroy]
  resources :rubric_items, only: %i[update destroy]
  resources :rubrics do
    resources :items, controller: :rubric_items, only: %i[new create edit]
  end
  resources :users, except: %i[new create]

  resource :dashboard, only: :show
  root 'home#index'
end
