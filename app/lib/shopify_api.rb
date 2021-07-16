class ShopifyApi
	require 'net/http'
	require 'uri'
	def response 
		uri = URI.parse("https://pinkwug-dev-store.myshopify.com/admin/api/2021-07/graphql.json")
		req_options = {
		  use_ssl: uri.scheme == "https",
		}
		Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		  request = Net::HTTP::Post.new uri
		  request.content_type = "application/graphql"
		  request["X-Shopify-Access-Token"] = "#{ENV['SHOPIFY_API_SECRET']}"
		  request.body = "
		    {
		      collections(first: 10) {
		        edges {
		          node {
		            title
		            id
		            products(first: 12) {
		              edges {
		                node {
		                  id
		                  title
		                  handle
		                  featuredImage {
		                    originalSrc
		                  }
		                  variants(first: 1) {
		                    edges {
		                      node {
		                        price
		                      }
		                    }
		                  }
		                }
		              }
		            }
		          }
		        }
		      }
		    }
		    "
		  response = http.request(request)
		  JSON.parse(response.body)
		end
		# uri = URI.parse("https://#{ENV['SHOPIFY_API_LINK']}/admin/api/2021-07/graphql.json")
		# request = Net::HTTP::Post.new(uri)
		# request.content_type = "application/graphql"
		# request["X-Shopify-Access-Token"] = "#{ENV['SHOPIFY_API_SECRET']}"
		# request.body = "
		#   {
		# 	  collections(first: 10) {
		# 	    edges {
		# 	      node {
		# 	      	title
		# 	        id
		# 	        products(first: 12) {
		# 	          edges {
		# 	            node {
		# 	              id
		# 	              title
		# 	              handle
		# 	              featuredImage {
		# 	                originalSrc
		# 	              }
		# 	              variants(first: 1) {
		# 	                edges {
		# 	                  node {
		# 	                    price
		# 	                  }
		# 	                }
		# 	              }
		# 	            }
		# 	          }
		# 	        }
		# 	      }
		# 	    }
		# 	  }
		# 	}
		#   "
		# req_options = {
		#   use_ssl: uri.scheme == "https",
		# }
		# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		#   http.request(request)
		# end
		# JSON.parse(response.body)
	end
end