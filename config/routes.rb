# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments
    post 'archive', on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
