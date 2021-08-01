Rails.application.routes.draw do
  constraints(host: /^www\./i) do
      get '(*any)' => redirect { |params, request|
        URI.parse(request.url).tap { |uri| uri.host.sub!(/^www\./i, '') }.to_s
      }
   end
   root controller: :strips, action: :show, id: -1
   get 'about' => 'strips#about'
   resources :archive, as: :strips, controller: :strips, only: [:index]
   resources :comics, as: :strips, controller: :strips, only: [:show]
   resources :shop, as: :store, controller: :store, only: [:index]
   match "/404", to: "errors#not_found", via: :all
   match "/422", to: "errors#unacceptable", via: :all
   match "/500", to: "errors#internal_server_error", via: :all
   
   get '/sitemap.xml', to: 'sitemaps#index', defaults: { format: 'xml'}

   devise_for :admin_users, ActiveAdmin::Devise.config
   ActiveAdmin.routes(self)
end
