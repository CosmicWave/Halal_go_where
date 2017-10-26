class Photo < ApplicationRecord

	belongs_to :foody
	has_many :likeables, dependent: :destroy
	has_many :users_liked, through: :likeables, source: :foody
#	belongs_to :food
#	has_many :reviews,  dependent: :destroy

	mount_uploader :avatar, AvatarUploader

end