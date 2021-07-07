class StripsController < ApplicationController
	before_action :set_strip, only: [:show]
	def index
		@strips = Strip.filtered(query_params).reverse
	end
	def show
		@title       = @strip.title
		@keywords    = @strip.keywords.push("Pink Wug", "Comics")
		@id          = @strip.id
		if (@strip == Strip.last)
			@keywords = @strip.keywords.push("latest")
			# This is here so that this class gets added only to the latest comic, since all other ones don't define @last
			@last = "last" 
		end
		@first_strip    = Strip.first
		@last_strip     = Strip.last
		@previous_strip = Strip.where(["id < ?", @id]).order('id').last || @first_strip
		@next_strip     = Strip.where(["id > ?", @id]).order('id').first || @last_strip
		@random_strip   = Strip.where(["id != ?", @id]).order_by_rand.first

		@first_strip    = strip_path(@first_strip, anchor: "main") 
		@last_strip     = strip_path(@last_strip, anchor: "main") 
		@previous_strip = strip_path(@previous_strip, anchor: "main") 
		@next_strip     = strip_path(@next_strip, anchor: "main") 
		@random_strip   = strip_path(@random_strip, anchor: "main")
	end
	private
		def set_strip
			if (params[:id] == -1)
				@strip = Strip.last 
			else
				@strip = Strip.find(params[:id])
			end
		end
		def query_params
			query_params = params[:query]
			query_params ? query_params.permit(:text) : {}
		end
	end