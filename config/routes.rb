Rails.application.routes.draw do
  root to: 'players#index'
  resources :players
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
