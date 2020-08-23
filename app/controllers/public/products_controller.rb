class Public::ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
    @genres = Genre.where(status: 'true').all
  end


  def index
  	@products = Product.where(status: 'true').page(params[:page]).per(8)
    @genres = Genre.where(status: 'true').all
  end
end
