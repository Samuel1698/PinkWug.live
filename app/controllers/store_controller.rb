class StoreController < ApplicationController	
	def index	
		@shopify = ShopifyApi.new().response["data"]["collections"]["edges"]
	end
end