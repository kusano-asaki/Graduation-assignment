Rails.application.routes.draw do
  root to: 'tops#index'

  resources :tops, only: [:index]
  get 'tops/detail'
  resources :players
  resources :users, only: [:new, :show, :create] do
    get :follow, on: :member
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :conversations do
    resources :messages
  end
end
