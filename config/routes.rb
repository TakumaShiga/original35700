Rails.application.routes.draw do
  
  devise_for :users
  root to: 'tweets#index'
  resources :users, only: [:show, :edit, :update]
  resources :tweets do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
