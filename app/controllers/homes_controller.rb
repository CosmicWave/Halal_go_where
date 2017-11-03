class HomesController < ApplicationController

	def index
		@photos = Photo.search(params[:search])
		@foodies = Foody.all

		@latest_photos = Photo.last(3)
	end

	def view_more
		@photos = Photo.all
	end

	def search_photos
		@params = params
		@searched_photo = params[:search_query]
		@photos = Photo.where('title LIKE :query OR restaurant LIKE :query', { query: "%#{@searched_photo}%" })
	end


 end