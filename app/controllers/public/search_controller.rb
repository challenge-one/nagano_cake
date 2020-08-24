class Public::SearchController < ApplicationController
	before_action :authenticate_customer!
	def search
		@genres = Genre.where(status: 'true').all
		@products = Product.where("name LIKE?","%#{params[:name]}%").page(params[:page]).per(10)
	end
end
