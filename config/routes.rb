Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :reviews
  resources :rides do
    resources :requests
  end
end
