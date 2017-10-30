class DisapprovesController < ApplicationController

	def convert
		current_restaurant = Restaurant.find(params[:restaurant_id])
		current_dissaprove = current_restaurant.disapproves.find_by(foody_id: current_foody.id)
		current_dissaprove.recommend_this(current_dissaprove)
		redirect_to current_restaurant
	end

	def create
		restaurant = Restaurant.find(params[:restaurant_id])
		disapprove = restaurant.disapproves.build(foody_id: current_foody.id)
		if disapprove.save
			redirect_to restaurant
		else
			flash.now[:notice] = 'You have to sign in to dislike'
		end
	end


	def destroy
		restaurant = Restaurant.find(params[:restaurant_id])
		disapprove = restaurant.disapproves.find_by(foody_id: current_foody.id)
		disapprove.destroy
		redirect_to restaurant
	end


end