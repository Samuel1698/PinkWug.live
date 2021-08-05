Rails.application.routes.draw do
  constraints(host: /^www\./i) do
    get '(*any)' => redirect { |params, request|
      URI.parse(request.url).tap { |uri| uri.host.sub!(/^www\./i, '') }.to_s
    }
  end
  root controller: :strips, action: :show, id: -1

  direct :rails_public_blob do |blob|
    if Rails.env.test? || Rails.env.development?
      route = 
        # ActiveStorage::VariantWithRecord was introduced in Rails 6.1
        # Remove the second check if you're using an older version
        if blob.is_a?(ActiveStorage::Variant) || blob.is_a?(ActiveStorage::VariantWithRecord)
          :rails_representation
        else
         :rails_blob
        end
      route_for(route, blob)
    else
      File.join("#{ENV['S3_BUCKET_NAME']}", blob.key)
    end
  end
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
