Rails.application.routes.draw do
  root controller: :strips, action: :show, id: Strip.last.id
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'about' => 'strips#about'
  resources :archive, as: :strips, controller: :strips, only: [:index]
  resources :comics, as: :strips, controller: :strips, only: [:show]
end
