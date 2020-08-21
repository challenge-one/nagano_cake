class Public::ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  end

  def genre_index
  	@genre = Genre.find(params[:id])
  	@genre_products = @genre.products.all
  end

  def index
  	@products = Product.all
  end
end
