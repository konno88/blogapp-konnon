Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'articles#home'

  resources :articles do
    resources :comments, only: [:new, :create]

    resource :like, only: [:show, :create, :destroy]
  end

  resources :favorites, only: [:index]

  resource :profile, only: [:show, :edit, :update]

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resource :followings, only: [:show]

  resource :followers, only: [:show]

  resources :user_followings, only: [:show, :index]

  resources :user_followers, only: [:show, :index]

  resource :timeline, only: [:show]

  resources :searches, only: [:index]
end
