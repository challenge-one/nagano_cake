class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item, only: [:show, :update, :destroy]
  before_action :set_customer

  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @current_item = CartItem.find_by(product_id: @cart_item.product_id, customer_id: @cart_item.customer_id)
    if @current_item.blank?
      if @cart_item.save
        redirect_to public_cart_items_path
      else
        @carts_items = @customer.cart_items.all
        redirect_to public_cart_items_path
      end
    else
      @current_item.number += params[:number].to_i
      @current_item.update(cart_item_params)
      redirect_to public_cart_items_path
    end
  end

  def update
    @cart_item.update(number: params[:number].to_i)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_products_path
  end

  private
  def set_customer
    @customer = current_customer
  end
  def setup_cart_item
    @cart_item = CartItem.find(params[:id])
  end
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id, :number)
  end
end
