class HomesController < ApplicationController

	def index
		@photos = Photo.all
		@foodies = Foody.all
		@likes = Like.all
		@dislikes = Dislike.all	
	end

 end