class Foodies::PhotosController < ApplicationController

before_action :authenticate_foody!, only: [:create, :edit, :update, :destroy, :new]

	def index
		if params[:tag]
			@photos = Photo.tagged_with(params[:tag])
		else
			@photos = Photo.all
		end

		@foodies = Foody.all
		
	end


	def new
		@photo = Photo.new
	end


	def create
    @photo = Photo.new(photo_params)
    @photo.foody = current_foody
    if @photo.save	
			flash[:notice] = "Successfully Updated"
			redirect_to foodies_photo_path(id: @photo.id)
		else
			flash.now[:notice] = "Not Successfully Updated"
			render :new
		end
	end


	def show
		@photo = Photo.find_by(id: params[:id])
		@photos = Photo.all
	end


	def edit
		@photo = Photo.find_by(id: params[:id])
	end


	def update
		@photo = Photo.find(params[:id])
		@photo.foody_id = current_foody.id
		if @photo.update(photo_params)
			
			flash[:notice] = "Successfully Updated"
			redirect_to foodies_photo_path(id: @photo.id)
			
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
  
  def view_more
	#	@photo = Photo.find_by(id: params[:id])
		@photos = Photo.all
	end

	private

	def photo_params
		params.require(:photo).permit(:title, :description, :price, :avatar, :restaurant, :tag_list)
	end

end

