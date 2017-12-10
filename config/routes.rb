Rails.application.routes.draw do
  get "books/show"
  get "books/new"
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :user_follow_relationships, only: %i(create destroy)
  resources :publishers
  resources :users
  resources :books
end
