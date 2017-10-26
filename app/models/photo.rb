class Photo < ApplicationRecord

	belongs_to :foody
	has_many :likeables, dependent: :destroy
#	belongs_to :food
#	has_many :reviews,  dependent: :destroy

	mount_uploader :avatar, AvatarUploader

end