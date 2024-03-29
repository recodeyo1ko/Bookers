Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about" => "homes#about", :as => "about"

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    # resources :chats, only: [:show, :create]
  end
  get "search" => "books#search"
  resources :chats, only: [:show, :create]

  resources :groups do 
    get "join" => "groups#join", as: "join"
    delete "leave" => "groups#leave", as: "leave"
    resources :notices, only: [:new, :create]
    get "notices" => "notices#sent"

  end
end
