Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    
    resource :favorites, only: [:create, :destroy]

  end
  resources :users, only: [:show, :edit, :update]

end
