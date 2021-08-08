class StripsController < ApplicationController
	before_action :set_strip, only: [:show, :index]
	helper StripsHelper
	def index
		@strips = Strip.filtered(query_params).order("created_at DESC")
		@strips_months = @strips.group_by { |s| s.created_at.beginning_of_month }
	end
	def show
		@title    = @strip.title
		@keywords = @strip.keywords
		@alt      = "pinkwug comic: " + @strip.transcript
		@og_img   = helpers.strip_variant(@strip, "786")
		if @strip.description.blank?
			@description = "PinkWug Comic: " << @strip.title
		else 
			@description = @strip.description
		end
		if (@strip == Strip.last)
			@keywords = @strip.keywords.push("latest")
			@last = "last"
		end
		@first_strip    = Strip.order("created_at ASC").first
		@last_strip     = Strip.order("created_at ASC").last
		@previous_strip = Strip.where(["created_at < ?", @strip.created_at]).order('created_at').last || @first_strip
		@next_strip     = Strip.where(["created_at > ?", @strip.created_at]).order('created_at').first || @last_strip
		@random_strip   = Strip.where(["id != ?", @strip.id]).order_by_rand.first

		@links = @strip.links.split(" ")
	end
	
	private
		def set_strip
			if (params[:id] == -1 || params[:id] == nil)
				@strip = Strip.order("created_at ASC").last 
				@strip.description = "PinkWug Comics"
				@SEO = "pinkwug comic"
			else
				@strip = Strip.order("created_at ASC").find(params[:id])
			end
		end
		def query_params
			query_params = params[:query]
			query_params ? query_params.permit(:text) : {}
		end
	end