Rails.application.routes.draw do
  root "stories#index"
  resources :locations
  resources :categories
  devise_for :users
  resources :stories do
    member do
      put "like", to: "stories#upvote"
    end
  end
end
