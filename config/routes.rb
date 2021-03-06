# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'

  resources :boards, only: %i[index new create edit update destory] do
    resources :tasks do
      resources :comments, only: %i[new create]
    end
  end
end
