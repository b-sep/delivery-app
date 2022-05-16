Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :haulers, only: %i[index new create]
end
