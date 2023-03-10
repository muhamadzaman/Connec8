Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#news_feed'

  resources :users, only: :show do
    member do
      get :following, :followers
    end
    collection do
      get :search
    end
  end

  resources :posts do
    collection do
      get 'news_feed'
    end
  end

  resources :relationships, only: [:create, :destroy]
end
