Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  resources :posts
  resources :users, only: [:index, :show]
  resources :comments, only: [:create, :destroy]
end
