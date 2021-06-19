Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'about' => 'strips#about'
  resources :all, as: :strips, controller: :strips, only: [:index]
  resources :comics, as: :strips, controller: :strips, only: [:show]
  root 'strips#latest'
end
