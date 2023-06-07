Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'home/about' =>'homes#about' ,as: 'about'

  resources :books
  resources :users

  resources :groups do 
    get "join" => "groups#join", as: "join"
    delete "leave" => "groups#leave", as: "leave"
    get "new_notice" => "groups#new_notice", as: "new_notice"
    post "send_notice" => "groups#send_notice", as: "send_notice"

  end
end
