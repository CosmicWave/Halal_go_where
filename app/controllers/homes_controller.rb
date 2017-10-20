class HomesController < ApplicationController

	def index
		@photos = Photo.all
		@foodies = Foody.all
	end

end