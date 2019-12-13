Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  get   'products'      =>  'products#index'
  get   'products/new'  =>  'products#new'
  post  'products'      =>  'products#create'
  get   'products/:id'  =>  'products#show'
  delete 'products/:id' =>  'products#destroy'
  resources :users, only: [:index,:show]
end
