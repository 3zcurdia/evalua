# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'dashboard/index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  # resources :evaluations, only: %i[index show destroy] do
  #   collection do
  #     resources :pull_requests, controller: :pull_request_evaluations, except: %i[index show destroy]
  #     resources :repositories, controller: :repository_evaluations, except: %i[index show destroy]
  #   end
  # end
  resources :rubric_items, only: %i[update destroy]
  resources :rubrics do
    resources :items, controller: :rubric_items, only: %i[new create edit]
  end

  resource :dashboard, only: :show
  root 'home#index'
end
