class FoodiesController < ApplicationController

	before_action :authenticate_foody!, only: [:edit, :update]
	before_action :check_authorisation, only: [:edit, :update]
	before_action :set_foodies

	def show
		@photos = Photo.all
		@foody = Foody.find(params[:id])
		@foodyphoto = @foody.photos.order(created_at: :desc)
	
	end

	def edit
	end

	def update
		if @foody.update(foody_params)
			flash[:alert] = 'Succesfully saved'
			redirect_to @foody
		else
			flash.now[:alert] = 'Do fill any blanks'
			render :edit
		end
	end

	private

	def check_authorisation
		unless current_foody.id == params[:id].to_i
			redirect_to root_url
		end
	end

	def set_foodies
		@foody = Foody.find(params[:id])

	end

	def foody_params
		params.require(:foody).permit(:name, :status, :avatar)
	end

end