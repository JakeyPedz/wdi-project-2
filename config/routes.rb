Rails.application.routes.draw do
  root to: "home#home"
  # authenticated :user do
  #   devise_scope :user do
  #     root to: "stories#index", :as => "authenticated_root"
  #   end
  # end

  # unauthenticated do
  #   devise_scope :user do
  #     root to: "home#home", :as => "unauthenticated_root"
  #   end
  # end


  devise_for :users

  authenticate :user do
    resources :locations, only: [:edit, :new, :update, :create, :destroy]
    resources :categories, only: [:edit, :update, :new, :create, :destroy]
  end

  resources :locations, only: [:index, :show]
  resources :categories, only: [:index, :show]

  resources :users, only: [:index, :show]
  resources :stories do
    member do
      put "like", to: "stories#upvote"
    end
  end
  resources :comments, only: [:create, :destroy]
end
