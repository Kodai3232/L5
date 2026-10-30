Rails.application.routes.draw do
  get "top/main"
  root "top#main"
  get "top/main", to: "top#main"

  resources :users
  resources :tweets, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]

  resources :products, only: [:index, :new, :create, :destroy]
  resources :cart_items, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
end