class Admin::OrdersController < ApplicationController

	before_action :authenticate_admin!

  def top
    @count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
  end

  def index
    @path = Rails.application.routes.recognize_path(request.referer)
    if @path[:action] == "top"
      @orders = Order.page(params[:page]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    elsif @path[:action] == "show"
      @customer = Customer.find(@path[:id])
      @orders = @customer.orders.page(params[:page])
    else
      @orders = Order.page(params[:page])
    end

    case params[:order]
    when 'today'
      @orders = Order.page(params[:page]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    when 'customer'
      customer_id = Rails.application.routes.recognize_path(request.referer)[:id]
      @customer = Customer.find(customer_id)
      @orders = @customer.orders.page(params[:page])
    when 'all'
      @orders = Order.page(params[:page])
  
end
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
