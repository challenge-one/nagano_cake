class Public::SearchController < ApplicationController
	def search
		@genres = Genre.where(status: 'true').all
		@products = Product.where("name LIKE?","%#{params[:name]}%").page(params[:page]).per(10)
	end
end
