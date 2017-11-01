class Photo < ApplicationRecord

	belongs_to :foody
	has_many :likeables, dependent: :destroy
	has_many :users_liked, through: :likeables, source: :foody

	has_many :taggings
	has_many :photos, through: :taggings

	mount_uploader :avatar, AvatarUploader
	
	def self.search(search)
		if search
			where("title LIKE ?", "%#{search}%")
		else
			all
		end
	end

	def rating(photo)
		if photo.likeables.exists?

			((photo.likeables.where(review: 2).count) - (photo.likeables.where(review: 1).count) /
			# -----------------------------------------------------------------------------------
																			photo.likeables.count).round(1)
		else
			0
		end
	end

	acts_as_taggable_on :tags


end