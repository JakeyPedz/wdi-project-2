Rails.application.routes.draw do
  root "stories#index"
  resources :locations
  resources :categories
  devise_for :users
  resources :users, only: [:index, :show]
  resources :stories do
    member do
      put "like", to: "stories#upvote"
    end
  end
  resources :comments, only: [:create, :destroy]
end
