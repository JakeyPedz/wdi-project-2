Rails.application.routes.draw do
  root "stories#index"
  resources :locations
  resources :categories
  resources :stories
  devise_for :users
end
