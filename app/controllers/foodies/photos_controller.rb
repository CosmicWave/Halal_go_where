class Foodies::PhotosController < ApplicationController

	def index
		@foodies = Foody.all
		@photos = Photo.all
	end


	def new
		@photo = Photo.new
	end


	def create
		
		product_params = params[:photo].permit(:title, :description, :price, :avatar)
    	@photo = Photo.new(product_params)
    	@photo.foody_id = current_foody.id
    	if  @photo.save
    	 	flash[:notice] = "Successfully Updated"
			redirect_to root_path
		else
			flash.now[:notice] = "Not Successfully Updated"
			render :edit
		end
	end


	def show
		@photo = Photo.find_by(id: params[:id])
	end


	def edit
		@photo = Photo.find_by(id: params[:id])
	end


	def update
		photo_params = params.require(:photo).permit(:title, :description, :price, :avatar)
		@photo = Photo.find(params[:id])
		@photo.foody_id = current_foody.id
		if @photo.update(photo_params)
			flash[:notice] = "Successfully Updated"
			redirect_to root_path
		else
			flash.now[:notice] = "Not Successfully Updated"
			render :edit
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		flash[:notice] = "Photo deleted successfully"
		redirect_to root_path
	end

end
