class Tag < ApplicationRecord

	belongs_to :photo, optional: true
	belongs_to :restaurant, optional: true

end