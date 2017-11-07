class Photo < ApplicationRecord

	validates :avatar, presence: true
	validates :title, presence: true
	validates :description, length: { maximum: 130 }, presence: true
	validates :price, presence: true

	belongs_to :foody
	has_many :likeables, dependent: :destroy
	has_many :users_liked, through: :likeables, source: :foody

	has_many :taggings
	has_many :photos, through: :taggings

	mount_uploader :avatar, AvatarUploader
	
	def self.search(search)
		if search
			where("title LIKE :query OR restaurant LIKE :query", { query: "%#{ search }%" })
		else
			all
		end
	end

	def score(photo)
		if photo.likeables.exists?

			current_rating = ((photo.likeables.where(review: 2).count) - (photo.likeables.where(review: 1).count) /
			# ------------------------------------------------------------------------------------------------------
																			photo.likeables.count).round(1)
			photo.update(rating: current_rating * photo.likeables.count)
			return current_rating
		else
			0
		end
	end


	acts_as_taggable_on :tags


end