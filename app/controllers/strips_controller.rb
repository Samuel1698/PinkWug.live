class StripsController < ApplicationController
	before_action :set_strip, only: [:show]
	def index
		@strips = Strip.all 
	end
	def show
		@title   = @strip.title
		@subtext = @strip.subtext
		@id      = @strip.id

		@first_strip    = Strip.first
		@last_strip     = Strip.last
		@previous_strip = Strip.where(["id < ?", @id]).order('id').last || @first_strip
		@next_strip     = Strip.where(["id > ?", @id]).order('id').first || @last_strip
		@random_strip   = Strip.where(["id != ?", @id]).order_by_rand.first

		@first_strip    = strip_path(@first_strip, anchor: 'content')
		@last_strip     = strip_path(@last_strip, anchor: 'content')
		@previous_strip = strip_path(@previous_strip, anchor: 'content')
		@next_strip     = strip_path(@next_strip, anchor: 'content')
		@random_strip   = strip_path(@random_strip, anchor: 'content')
	end
	def latest
		redirect_to action: 'show', id: Strip.last
	end
	
	private
		def set_strip
			@strip = Strip.friendly.find(params[:id])
		end
		def strip_params
			strip_params = params.require(:strip).permit(:title,:subtext, :image, :transcript)
		end
	end