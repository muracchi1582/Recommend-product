Rails.application.routes.draw do
  devise_for :users, skip: :sessions

  devise_scope :user do #ログイン関係のパス名をloginとlogoutに変更
    get "login", to: "users/sessions#new", as: :new_user_session
    post "login", to: "users/sessions#create", as: :user_session
    delete "logout", to: "users/sessions#destroy", as: :destroy_user_session
  end

  root 'products#index'

  resources :products, only:[:index,:new, :create, :show, :destroy]
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
    end
  end
  
end
