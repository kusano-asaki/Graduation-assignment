Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'players#index'
  
  resources :players
  resources :users, only: [:new, :show, :create] do
    get :follow, on: :member
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
