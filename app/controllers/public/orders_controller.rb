class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.customer_id = current_customer
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
  end

  def complete
  end
end
