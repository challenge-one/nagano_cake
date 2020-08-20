class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end
  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    @genre = @product.genre
  end

  def index
    @products = Product.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  def destroy
  end
def product_params
    params.require(:product).permit(:name,:introduction,:price,:status,:image,:genre_id)
  end
end
