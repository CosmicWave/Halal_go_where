class HomesController < ApplicationController

	def index
		@photos = Photo.search(params[:search])
		@foodies = Foody.all
	end

	def search
		@params = params
		searched_restaurants = params[:search_query]
		@restaurants = Restaurant.where(name: searched_restaurants)
	end

 end