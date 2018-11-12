Rails.application.routes.draw do
  get "users/show"
  devise_for :users

  resources :gifts

  resources :users, only: [:show]

  get "/friend/:id", to: "home#friend", as: "friend"
  delete "/unfriend/:id", to: "home#unfriend", as: "unfriend"
  get "/friends", to: "home#friends", as: "friends"

  get "/search", to: "home#search"

  get "/profile", to: "home#profile"

  post "/reserve/:id", to: "home#reserve", as: "reserve"
  delete "/unreserve/:id", to: "home#unreserve", as: "unreserve"

  root "home#index"
end
