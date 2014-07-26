Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :articles, only: %w(new create show)
end
