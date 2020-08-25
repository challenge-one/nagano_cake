class Public::HomesController < ApplicationController
  def top
  	@products = Product.all.page(params[:page]).per(4)
  	@genres = Genre.where(status: "true").all
  end

  def about
  end
end
