class Photo < ApplicationRecord


	belongs_to :foody
#	belongs_to :food
#	has_many :dislikes,  dependent: :destroy
#	has_many :likes,  dependent: :destroy
#	has_many :reviews,  dependent: :destroy

	mount_uploader :avatar, AvatarUploader

end