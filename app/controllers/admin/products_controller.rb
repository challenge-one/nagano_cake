class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
       @product = Product.new(product_params)
    if @product.save
       flash[:notice] = "You have creatad product successfully."
       redirect_to admin_product_path(@product)
    else
       render :new
    end
  end

  def edit
      @product = Product.find(params[:id])
  end

  def show
      @product = Product.find(params[:id])
      @product_tax = (@product.price * 1.10).floor
      @genre = @product.genre
  end

  def index
      @products = Product.order(created_at: :ASC).page(params[:page])
  end

  def update
        @product = Product.find(params[:id])
     if @product.update(product_params)
        flash[:notice] = "You have updated product successfully."
        redirect_to admin_product_path(@product)
    else
        reder :edit
    end
 end
 
  def destroy
  end
def product_params
    params.require(:product).permit(:name,:introduction,:price,:status,:image,:genre_id)
  end
end
