Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  devise_for :admins

  namespace :admin do
    get '/delivery-app', to: 'admins#index'
    resources :haulers
    resources :prices, only: %i[index]
    resources :orders, only: %i[index create show]
  end

  namespace :user do
    resources :haulers, only: %i[show] do
      resources :vehicles, only: %i[ index show new create]
      resources :prices, only: %i[index new create]
      resources :delivery_dates, only: %i[index new create]
      resources :orders, only: %i[show edit update] do
        resources :order_historics, only: %i[new create]
      end
    end
  end
end