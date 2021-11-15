# frozen_string_literal: true

Rails.application.routes.draw do
  root "posts#index"

  resources :kategori, controller: :categories, as: :categories
  resources :gonderi, controller: :posts, as: :posts
end
