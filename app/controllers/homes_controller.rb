class HomesController < ApplicationController

	def index
		@photos = Photo.search(params[:search])
		@foodies = Foody.all
		@photos_according_to_ratings = Photo.order('rating DESC').first(4)
		@latest_photos = Photo.last(4)

	end

	def contact
	end

	def about_us
	end

	def view_more
		@photos = Photo.all
		@photos_according_to_latest = Photo.order("created_at DESC")
	end

	def top_reviews
		@photos_according_to_ratings = Photo.order('rating DESC')
	end

	def search_photos
		@params = params
		@searched_photo = params[:search_query]
		@photos = Photo.where('title ILIKE :query OR restaurant ILIKE :query', { query: "%#{@searched_photo}%" })
	end


 end