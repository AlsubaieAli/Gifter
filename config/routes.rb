Rails.application.routes.draw do
  devise_for :users

  resources :gifts

  get "/profile", to: "home#profile"

  root "home#index"
end
