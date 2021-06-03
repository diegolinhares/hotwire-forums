# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :discussions do
    resources :posts, module: :discussions
  end

  root to: 'main#index'
end
