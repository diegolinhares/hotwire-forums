# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users

  resources :discussions do
    resources :posts, module: :discussions
    resources :notifications, module: :discussions

    collection do
      get 'category/:id', to: 'categories/discussions#index', as: :category
    end
  end

  resources :notifications, only: :index do
    collection do
      post 'mark_as_read', to: 'notifications#read_all', as: :read
    end
  end

  root to: 'main#index'
end
