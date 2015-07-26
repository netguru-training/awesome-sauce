Rails.application.routes.draw do
  root to: 'rides#index'
  devise_for :users
  resources :users do
    resources :reviews
  end
  resources :rides do
    resources :requests
  end
end
