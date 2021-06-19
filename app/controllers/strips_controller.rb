class StripsController < ApplicationController
	before_action :set_strip, only: [:show]
	def index
		@strips = Strip.filtered(query_params).reverse
	end
	def show
		@title       = @strip.title
		@keywords    = @strip.keywords.push("Pink Wug", "Comics")
		@id          = @strip.id

		@first_strip    = Strip.first
		@last_strip     = Strip.last
		@previous_strip = Strip.where(["id < ?", @id]).order('id').last || @first_strip
		@next_strip     = Strip.where(["id > ?", @id]).order('id').first || @last_strip
		@random_strip   = Strip.where(["id != ?", @id]).order_by_rand.first

		@first_strip    = strip_path(@first_strip)
		@last_strip     = strip_path(@last_strip)
		@previous_strip = strip_path(@previous_strip)
		@next_strip     = strip_path(@next_strip)
		@random_strip   = strip_path(@random_strip)
	end
	def latest
		redirect_to action: 'show', id: Strip.last
	end
	private
		def set_strip
			@strip = Strip.find(params[:id])
		end
		def strip_params
			params.require(:strip).permit(:title, :description, :image, :keywords, :transcript)
		end
		def query_params
			query_params = params[:query]
			query_params ? query_params.permit(:text) : {}
		end
	end