class Admin::OrderItemsController < ApplicationController
	before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      flash[:success] = "制作ステータスを変更しました"
      if @order_item.order.order_items.pluck(:status).include?("制作中")
        @order_item.item_create
      end

      status_checks = @order_item.order.order_items.pluck(:status)
      count = 0
      status_checks.each do |status_check|
        if status_check == "制作完了"
          count = count + 1
        end
      end
      if count == @order_item.order.order_items.count
        @order_item.item_create_complete
      end

      redirect_to admin_order_path(@order_item.order)
    else
      render "show"
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:status)
  end
end