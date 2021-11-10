# frozen_string_literal: true

Rails.application.routes.draw do
<<<<<<< HEAD
  root "posts#index"

  resources :kategoriler, controller: :categories, as: :categories
  resources :gonderiler, controller: :posts, as: :posts
=======
  resources :posts
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> 0550685dbe3bb9c3ff3aa298a3def16317b458f2
end
