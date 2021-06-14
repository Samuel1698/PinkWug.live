Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'about' => 'strips#about'
  resources :strips
  root 'strips#latest'
end
