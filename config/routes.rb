Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"
  get 'homes/about' => 'homes#about', as:'about'
  post 'books' => 'books#create'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
