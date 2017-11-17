Rails.application.routes.draw do
  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"
  get 'basic_search' => 'apartments#basic_search'

  get 'admin/update'

  resources :apartments
  root 'apartments#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
