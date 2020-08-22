class Public::CartItemsController < ApplicationController

  before_action :setup_cart_item!, only: [:create, :update, :destroy, :destroy_all]

  def index
    @cart_items = current_cart.cart_items
  end

  def create
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(product_id: params[:product_id])
    end

    @cart_item.number += params[:number].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update
    @cart_item.update(number: params[:number].to_i)
    redirect_to current_cart
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
  end

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end
end
