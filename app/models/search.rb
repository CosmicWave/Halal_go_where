class Search < ApplicationRecord

	def search_restaurant

		restaurants = Restaurant.all

		restaurants = restaurants.where(["name LIKE ?", "%#{keyword}%"]) if keyword.present?
		restaurants = restaurants.where(["location LIKE ?", "%#{keyword}%"]) if location.present?
		restaurants = restaurants.where(["category LIKE ?", category]) if category.present?
		# restaurants = restaurants.where(["price >= ?", min_price]) if min_price.present?
		# restaurants = restaurants.where(["price <= ?", max_price]) if max_price.present?
		restaurants = restaurants.where(["certification LIKE ?", certification]) if certification.present?

		return restaurants

		photos = Photo.all

		photos = photos.where(["name LIKE ?", "%#{keyword}%"]) if name.present?

	end


end