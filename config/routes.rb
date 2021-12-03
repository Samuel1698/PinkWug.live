Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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

  get '/products', to: redirect('/shop')
  get '/collections', to: redirect('/shop')

  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get '/sitemap.xml', to: 'sitemaps#index', defaults: { format: 'xml'}

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  direct :cdn_image do |model, options|
    if model.respond_to?(:signed_id)
      route_for(
        :rails_service_blob_proxy,
        model.signed_id,
        model.filename,
        options.merge(host: 'pinkwug.live')
      )
    else
      signed_blob_id = model.blob.signed_id
      variation_key  = model.variation.key
      filename       = model.blob.filename

      route_for(
        :rails_blob_representation_proxy,
        signed_blob_id,
        variation_key,
        filename,
        options.merge(host: 'pinkwug.live')
      )
    end
  end
end
