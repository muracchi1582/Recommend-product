Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only:[:index,:new, :create, :show, :destroy]
  resources :users, only: [:index] do
    resources :card, only: [:new]
  end
  get 'products/:id/purchase' => 'products#purchase'
  
end
