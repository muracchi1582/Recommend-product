Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products, only:[:index,:new, :create, :show, :destroy] do
    resources :purchase, only: [:index] do
      collection do
        post 'pay'
        get 'done'
      end  
    end
  end

  resources :users, only: [:index] do
    resources :cards, only: [:new] do
      collection do
        get 'show'
        post 'pay'
        post 'delete'
      end
    end
  end

  resources :signup, only: [:create] do 
    collection do
      get 'new'
      get 'user_registration1'
      get 'user_registration2'
      get 'done'
    end
  end

  get "users/:id/history" => "users#history"
  get "products/:id/search" => "products#search", as: :search_products
end
