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

	def self.tagged_with(name)
		Tag.find_by_name!(name).photos
	end

	def self.tag_counts
		Tag.select
	end

	def tag.list
		tags.map(&:name).join(", ")
	end
end