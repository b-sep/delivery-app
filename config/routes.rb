Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  devise_for :admins

  namespace :admin do
    resources :haulers
  end

  namespace :user do
    resources :haulers, only: %i[ show ] do
      resources :vehicles, only: %i[ index show new create]
    end
  end

end
