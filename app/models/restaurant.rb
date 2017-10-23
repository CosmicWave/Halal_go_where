class Restaurant < ApplicationRecord

	#has_many :foods
	has_many :recommends
	
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :location, presence: true
	validates :certification, presence: true

end