class Admin::OrdersController < ApplicationController

	before_action :authenticate_admin!

  def index
    @path = Rails.application.routes.recognize_path(request.referer)
    @orders = Order.all.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_family_name = @order.customer.family_name
    @order_first_name = @order.customer.first_name
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "注文ステータスを変更しました"
      redirect_to admin_order_path(@order)
    else
      render "show"
    end
  end

  private
  def set_customer
    @customer = current_customer
  end

  def order_params
    params.require(:order).permit(:customer_id, :cash_method, :postage, :total_amount, :status, :addressee, :postcode, :address, :created_at)
  end

end
