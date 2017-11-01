class HomesController < ApplicationController

	def index
		@photos = Photo.search(params[:search])
		@foodies = Foody.all

		@latest_photos = Photo.last(3)
	end

	def view_more
		@photos = Photo.all
	end

	def search
		@params = params
		searched_restaurants = params[:search_query]
		@restaurants = Restaurant.where(name: searched_restaurants)
	end


 end