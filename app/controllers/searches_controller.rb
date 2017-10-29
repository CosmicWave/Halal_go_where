class SearchesController < ApplicationController

	def new
		@search = Search.new
		@categories = Restaurant.pluck(:category).uniq
	end

	def create
		@search = Search.create(search_params)
		redirect_to search_path(@search)
	end

	def show
		@search = Search.find(params[:id])
	end

	private

	def search_params
		params.require(:search).permit(:keyword, :category, :location, :certification, :min_price, :max_price)
	end

end