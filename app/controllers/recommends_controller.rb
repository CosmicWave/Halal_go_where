class RecommendsController < ApplicationController

	before_action :set_restaurant

	def create
		current_restaurant = Restaurant.find(params[:restaurant_id])
		new_recommendation = current_restaurant.recommends.build(foody_id: current_foody.id)
		# new_recommendation = Recommend.create(restaurant_id: current_restaurant.id, foody_id: current_foody.id)
		if new_recommendation.save
			redirect_to current_restaurant
		else
			flash.now[:notice] = 'Sign in to recommend!'
			redirect_to "/foodies/sign_up"
		end
	end

	def destroy
		@current_restaurant = Restaurant.find(params[:restaurant_id])
		@current_recommend = @current_restaurant.recommends.find_by(foody_id: current_foody.id)
		@current_recommend.destroy
		redirect_to @current_restaurant
	end

	private

	def set_restaurant
		current_restaurant = Restaurant.find(params[:restaurant_id])
	end

end