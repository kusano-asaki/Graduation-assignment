Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'players#index'

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
