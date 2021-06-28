Rails.application.routes.draw do
  root controller: :strips, action: :show, id: -1
  get '/store', :to => 'home#index'
  mount ShopifyApp::Engine, at: '/store'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'about' => 'strips#about'
  get 'store' => 'products#index'
  resources :archive, as: :strips, controller: :strips, only: [:index]
  resources :comics, as: :strips, controller: :strips, only: [:show]

end
