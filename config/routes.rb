# frozen_string_literal: true

Rails.application.routes.draw do
  root "posts#index"

  resources :kategoriler, controller: :categories, as: :categories
  resources :gonderiler, controller: :posts, as: :posts
end
