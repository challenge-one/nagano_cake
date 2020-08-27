class Admin::OrdersController < ApplicationController

	before_action :authenticate_admin!

  def top
  end

  def index
    case params[:order]
    when 'today' then
      @orders = Order.page(params[:page]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    when 'customer' then
      customer_id = Rails.application.routes.recognize_path(request.referer)[:id]
      @customer = Customer.find(customer_id)
      @orders = @customer.orders.page(params[:page])
    when 'all' then
      @orders = Order.page(params[:page])
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "注文ステータスを変更しました"
      @order.order_cash_complete
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
    params.require(:order).permit(:status)
  end

end
