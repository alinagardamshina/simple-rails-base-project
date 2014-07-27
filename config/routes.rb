Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :articles, except: :index do
    resources :comments, only: :create
  end
end
