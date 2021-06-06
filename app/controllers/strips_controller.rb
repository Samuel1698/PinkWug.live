class StripsController < ApplicationController
	before_action :set_strip, only: [:show]
	def index
		@strips = Strip.all 
	end
	def show
		@title = @strip.title
	end
	def new
		@strip = Strip.new
	end
	def create
		@strip = Strip.new(strip_params)
		if @strip.save
			redirect_to @strip, notice: 'Strip was successfully created'
		else
			render action: 'new'
		end
	end
	def edit
	end
	def update
		if @strip.update(strip_params)
			redirect_to @strip, notice: "Strip was sucessfully updated"
		else
			render action: 'edit'
		end
	end
	def prev
	end
	def latest
		redirect_to action: 'show', id: Strip.last
	end
	
	private
		def set_strip
			@strip = Strip.find(params[:id])
		end
		def strip_params
			strip_params = params.require(:strip).permit(:title,:subtext, :image, :transcript)
		end
	end
