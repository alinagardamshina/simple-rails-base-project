Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :articles, only: %w(new create show)
end
