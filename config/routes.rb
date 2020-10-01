Rails.application.routes.draw do
  root to: 'players#index'
  resources :players
  resources :users, only: [:new, :show, :create]
end
