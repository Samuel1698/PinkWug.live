class StripsController < ApplicationController
	before_action :set_strip, only: [:show]
	def index
		@strips = Strip.all 
	end
	def show
		@title = @strip.title
		@subtext = @strip.subtext
		@id = @strip.id

		@first_strip = strip_path(Strip.first)<<"#content"

		if Strip.where(["id < ?", @id]).order('id').last.nil?
			@previous_strip = @first_strip
		else
			@previous_strip = strip_path(Strip.where(["id < ?", @id]).order('id').last)<<"#content"
		end

		@random_strip = strip_path(Strip.where(["id != ?", @id]).order_by_rand.first)<<"#content"

		if Strip.where(["id > ?", @id]).order('id').first.nil?
			@next_strip  = @last_strip
		else
			@next_strip = strip_path(Strip.where(["id > ?", @id]).order('id').first)<<"#content"
		end

		@last_strip = strip_path(Strip.last)<<"#content"

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