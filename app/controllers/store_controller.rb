class StoreController < ApplicationController
	def index
		mug_collection     = 271098577084
		clothes_collection = 271099494588
		sticker_collection = 271099560124
		print_collection   = 271099527356

 		@mugs = HTTParty.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_SECRET']}@#{ENV['SHOPIFY_API_LINK']}/admin/api/2021-04/products.json?collection_id=#{mug_collection}")["products"]
 		@clothes = HTTParty.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_SECRET']}@#{ENV['SHOPIFY_API_LINK']}/admin/api/2021-04/products.json?collection_id=#{clothes_collection}")["products"]
 		@stickers = HTTParty.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_SECRET']}@#{ENV['SHOPIFY_API_LINK']}/admin/api/2021-04/products.json?collection_id=#{sticker_collection}")["products"]
 		@prints = HTTParty.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_SECRET']}@#{ENV['SHOPIFY_API_LINK']}/admin/api/2021-04/products.json?collection_id=#{print_collection}")["products"]
	end
end