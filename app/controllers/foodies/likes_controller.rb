class Foodies::LikesController < ApplicationController

	def create

		@photo = Photo.find(params[:photo_id])

		@like = @photo.likes.create(photo_id: params[:photo_id])
		@like.foody = current_foody
		
		@like.save

		redirect_to root_path

	end


	def destroy
		@photo = Photo.find(params[:photo_id])
		@like  = Like.find_by(photo_id: params[:photo_id], foody_id: current_foody.id)
    	@like.destroy
    	redirect_to root_path
    end

	def invalid
		@current_photo = Photo.find(params[:photo_id])
        @current_like = current_photo.likes.find_by(foody_id: current_foody.id)
        @current_like.like_this(current_like)
        redirect_to root_path
	       
	end


end