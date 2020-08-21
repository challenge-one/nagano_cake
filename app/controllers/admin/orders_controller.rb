class Admin::OrdersController < ApplicationController
	
  def index
  	# ヘッダーからの情報取得（全履歴）
  	@orders = Order.all
  	#  会員詳細からの情報取得（該当会員）
  	@customer_orders = Customer.orders.all
  	#  トップページからの情報取得（本日）
  	#  whereで範囲指定しただけなので取得できていない
  	@today_orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def show
  end

  def update
  end
end
