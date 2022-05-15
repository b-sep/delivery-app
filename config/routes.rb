Rails.application.routes.draw do
  root 'home#index'
  resources :haulers, only: [:index, :new, :create]
end
