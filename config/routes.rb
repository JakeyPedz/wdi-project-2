Rails.application.routes.draw do

  authenticated :user do
    devise_scope :user do
      root to: "stories#index", :as => "authenticated_root"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "home#home", :as => "unauthenticated_root"
    end
  end

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
