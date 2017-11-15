Rails.application.routes.draw do
  devise_for :users
  resources :apartments
  root 'apartments#index'
end
