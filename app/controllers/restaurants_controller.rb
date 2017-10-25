class RestaurantsController < ApplicationController

	before_action :set_restaurant, except: [:new, :create]

	def show
	end

	def new
		@new_restaurant = Restaurant.new
	end

	def create
		new_restaurant = Restaurant.create(restaurant_params)
		if new_restaurant.save
			flash[:notice] = "Succesful restaurant application"
			redirect_to restaurant_path(new_restaurant)
		else
			flash.now[:notice] = "Fill in your blanks"
			render :new
		end
	end

	def edit
	end

	def update
		if @restaurant.update(restaurant_params)
			flash[:notice] = "Succesful restaurant application"
			redirect_to restaurant_path(@restaurant)
		else
			flash.now[:notice] = "Fill in your blanks"
			render :edit
		end
	end

	# if stall is no longer in service
	# def destroy
	# 	@restaurant.destroy
	# end
	
	private

	def set_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :time, :location, :certification)
	end

end