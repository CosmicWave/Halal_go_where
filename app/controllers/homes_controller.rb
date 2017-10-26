class HomesController < ApplicationController

	def index
		@photos = Photo.all
		@foodies = Foody.all
		
	end

	def search
	end

 end