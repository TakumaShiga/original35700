Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  sessions: "users/sessions",
  registrations: "users/registrations"
  }, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
  }

  root to: 'tweets#index'
  resources :users, only: [:show, :edit, :update] do
    resource :follow
    resources :followings
    resources :followers
  end

  resources :tweets do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
end
