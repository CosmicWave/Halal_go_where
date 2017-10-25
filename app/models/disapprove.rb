class Disapprove < ApplicationRecord

	belongs_to :foody
	belongs_to :restaurant

	def recommend_this(current_dissaprove)
		Recommend.create(foody_id: current_dissaprove.foody.id, restaurant_id: current_dissaprove.restaurant.id)
		current_dissaprove.destroy
	end

end