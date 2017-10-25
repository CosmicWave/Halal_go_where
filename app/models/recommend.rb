class Recommend < ApplicationRecord

	belongs_to :foody
	belongs_to :restaurant

	def disapprove_this(current_reccommend)
		Disapprove.create(foody_id: current_reccommend.foody.id, restaurant_id: current_reccommend.restaurant.id)
		current_reccommend.destroy
	end
	
end