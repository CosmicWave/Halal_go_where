class Foodies::LikeablesController < ApplicationController

	before_action :check_authorisation
	before_action :set_current_photo
	before_action :current_status

	# 2 = like, 1 = dislike
	
	def create #new like
		create_like = Likeable.create(foody: current_foody, photo_id: set_current_photo.id, review: 2)
		create_like.save
		respond_to do |format|
			format.js {render 'create.js.erb'}
		end
	end

	def new #new dislike
		create_dislike = Likeable.create(foody: current_foody, photo_id: set_current_photo.id, review: 1)
		create_dislike.save
		respond_to do |format|
			format.js {render 'create.js.erb'}
		end
	end

	def convert_like
		current_status = Likeable.find_by(photo_id: Photo.find(params[:photo_id]), foody: current_foody)
		current_status.update(review: 1)
		respond_to do |format|
			format.js {render 'create.js.erb'}
		end
	end

	def convert_dislike
		current_status = Likeable.find_by(photo_id: Photo.find(params[:photo_id]), foody: current_foody)
		current_status.update(review: 2)
		respond_to do |format|
			format.js {render 'create.js.erb'}
		end
	end

	def destroy
		current_status.destroy
		respond_to do |format|
			format.js {render 'destroy.js.erb'}
		end
	end

	private

	def set_current_photo
		Photo.find(params[:photo_id])
	end

	def current_review 
		photo.likeables.find_by(foody_id: current_foody.id)
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