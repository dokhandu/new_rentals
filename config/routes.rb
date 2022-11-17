# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api/v1', defaults: { format: :json } do
    devise_for :users, controllers: {
      invitations: 'api/v1/invitations',
      passwords: 'api/v1/passwords',
      registrations: 'api/v1/registrations',
      sessions: 'api/v1/sessions'
    }
  end

  root 'home#index'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      post '/graphql', to: 'graphql#execute'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
