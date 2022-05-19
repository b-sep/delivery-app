Rails.application.routes.draw do
  root 'home#index'
  devise_for :admins
  devise_for :users
 
  namespace :admin do
    resources :haulers
  end
  
end
