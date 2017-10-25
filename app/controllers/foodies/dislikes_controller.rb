class Foodies::DislikesController < ApplicationController

	def create

		@photo = Photo.find(params[:photo_id])
		@dislike = @photo.dislikes.create(photo_id: params[:photo_id])
		@dislike.foody = current_foody
		@dislike.save
		redirect_to root_path

	end


	def destroy
		@photo = Photo.find(params[:photo_id])
		@dislike  = Dislike.find_by(photo_id: params[:photo_id], foody_id: current_foody.id)
    	@dislike.destroy
    	redirect_to root_path
    end

   def invalid
	    @current_photo = Photo.find(params[:photo_id])
        @current_dislike = current_photo.dislikes.find_by(foody_id: current_foody.id)
        @current_dislike.dislike_this(current_dislike)
        redirect_to root_path
	end

end