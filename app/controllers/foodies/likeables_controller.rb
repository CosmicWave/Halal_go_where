class Foodies::LikeablesController < ApplicationController

	def new_like
		Likeable.new if current_photo.

	end

	def new_dislike

	end

	private

	def current_photo
		Photo.find(params[:id])
	end
end