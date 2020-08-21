class Public::GenresController < ApplicationController
	def show
		@genre = Genre.find(params[:id])
		@genres = Genre.where(status: 'true').all
		@products = @genre.products.where(status: 'true').page(params[:page]).per(8)
	end

end
