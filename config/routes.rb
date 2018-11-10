Rails.application.routes.draw do
  devise_for :users

  resources :gifts

  get "/search", to: "home#search"

  get "/profile", to: "home#profile"

  root "home#index"
end
