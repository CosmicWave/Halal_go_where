class TagsController < ApplicationController

	def index
		# @tags = ActsAsTaggableOn::Tag.all
		if params[:tag]
			@photos = Photo.tagged_with(params[:tag])
  	else
  		@photos = Photo.all
		end
	end

	def show
		@tag = ActsAsTaggableOn::Tag.find(params[:id])
		@photos = Photo.tagged_with(@tag.name)
	end

	
end