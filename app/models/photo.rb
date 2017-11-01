class Photo < ApplicationRecord

	belongs_to :foody
	has_many :likeables, dependent: :destroy
	has_many :users_liked, through: :likeables, source: :foody

	mount_uploader :avatar, AvatarUploader

	acts_as_taggable_on :tags
end