class Restaurant < ApplicationRecord

	#has_many :foods
	has_many :recommends
	has_many :disapproves, class_name: "Disapprove"

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :location, presence: true
	validates :certification, presence: true

end