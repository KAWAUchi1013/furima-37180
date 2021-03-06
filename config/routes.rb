Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :items, only: [:new, :create] do
    resources :orders, only: [:index, :create]
  end
end
