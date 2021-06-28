Rails.application.routes.draw do
  root controller: :strips, action: :show, id: -1
  get 'about' => 'strips#about'
  get 'store' => 'strips#store'
  resources :archive, as: :strips, controller: :strips, only: [:index]
  resources :comics, as: :strips, controller: :strips, only: [:show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
