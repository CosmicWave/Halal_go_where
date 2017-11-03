class Foodies::LikeablesController < ApplicationController

	before_action :check_authorisation
	before_action :set_current_photo
	before_action :current_status
	# 2 = like, 1 = dislike
	
	def create #new like
		create_like = Likeable.create(foody: current_foody, photo_id: set_current_photo.id, review: 2)
		create_like.save
	end

	def new #new dislike
		create_dislike = Likeable.create(foody: current_foody, photo_id: set_current_photo.id, review: 1)
		create_dislike.save
	end

	def convert_like
		current_status = Likeable.find_by(photo_id: Photo.find(params[:photo_id]), foody: current_foody)
		current_status.update(review: 1)
	end

	def convert_dislike
		current_status = Likeable.find_by(photo_id: Photo.find(params[:photo_id]), foody: current_foody)
		current_status.update(review: 2)
	end

	def destroy
		current_status.destroy
	end

	private

	def set_current_photo
		Photo.find(params[:photo_id])
	end

	def current_status
		Likeable.find_by(photo_id: set_current_photo, foody: current_foody)
	end

	def check_authorisation
		unless foody_signed_in?
			redirect_to new_foody_session_path
		end
	end

end