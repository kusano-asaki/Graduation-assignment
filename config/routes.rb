Rails.application.routes.draw do
  root to: 'players#index'
  resources :players
end
