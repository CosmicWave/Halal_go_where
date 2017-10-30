class FoodsController < ApplicationController

	before_action :set_food, except: [:new, :create, :index, :destroy]

	def index
		@foods = Food.all
	end

	def new
		@food = Food.new
	end

	def create
		@food.foody_id = current_foody.id
		@food = Food.create(food_params)
    	if  @food.save
    	 	flash[:notice] = "Successfully Updated"
			redirect_to root_path
		else
			flash.now[:notice] = "Not Successfully Updated"
			render :edit
		end
	end

	def show

	end


	def edit
		
	end

	def update
		@food.foody_id = current_foody.id
		if @food.update(food_params)
			flash[:notice] = "Successfully Updated"
			redirect_to root_path
		else
			flash.now[:notice] = "Not Successfully Updated"
			render :edit
		end
	end


	def destroy
		@food = Food.find(params[:photo_id])
		@food  = Food.find_by(food_id: params[:food_id], foody_id: current_foody.id)
    	@food.destroy
    	redirect_to root_path
    end




	private

	def set_food
		@food = Food.find_by(id: params[:id])
	end

	def food_params
		params.require(:food).permit(:restaurant_id, :photo_id)
	end
end