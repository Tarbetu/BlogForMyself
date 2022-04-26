# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books
  root "categories#index"

  resources :books, shallow: true, param: :name, path: "", except: %i[index]
  # The route names are Turkish
  # Actually, the "resources" method should take a plural argument
  # like "kategoriler" or "gonderiler" (the -ler is plural suffix)
  # But it turned into a strange behavior: "/kategoriler/1" or "/gonderiler/1"
  # So I changed them into a singular form.
  resources :kategori, controller: :categories, as: :categories
  resources :gonderi, controller: :posts, as: :posts do
    resources :comments
  end
end
