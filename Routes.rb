Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :users, only: [:index, :show]
  
  resources :friendships, only: [:create, :destroy]
end