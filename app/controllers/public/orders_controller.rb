class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def new
    @order = Order.new
  end

  def create
    if current_customer.cart_items.exists?
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @customer = current_customer
      @add = params[:order][:add].to_i
      case @add
        when 1
          @order.postcode = @customer.postcode
          @order.address = @customer.address
          @order.addressee = full_name(@customer)
        when 2
          @order.postcode = params[:order][:postcode]
          @order.address = params[:order][:address]
          @order.addressee = params[:order][:addressee]
        when 3
          @order.postcode = params[:order][:postcode]
          @order.address = params[:order][:address]
          @order.addressee = params[:order][:addressee]
      end
      @order.save
      if Delivery.find_by(address: @order.address).nil?
        @address = Delivery.new
        @address.postcode = @order.postcode
        @address.address = @order.address
        @address.addressee = @order.addressee
        @address.customer_id = current_customer.id
        @address.save
      end

      current_customer.cart_items.each do |cart_item|
        order_item = @order.order_items.build
        order_item.order_id = @order.id
        order_item.product_id = cart_item.product_id
        order_item.number = cart_item.number
        order_item.purchased_price = cart_item.product.purchased_price
        order_item.save
        cart_item.destroy
      end

      render :complete
    else
       redirect_to root_path
     end
   end


  def index
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    if @order.customer_id != current_customer.id
      redirect_back(fallback_location: root_path)
      flash[:notice] = "アクセスに失敗しました"
    end
  end

  def confirm
      @order = Order.new
      @cart_item = current_customer.cart_items
      @order.cash_method = params[:cash_method]

      @add = params[:add].to_i
      case @add
      when 1
        @order.postcode = @customer.postcode
        @order.address = @customer.address
        @order.addressee = @customer.family_name
      when 2
        @sta = params[:order][:address].to_i
        @address = Delivery.find(@sta)
        @order.postcode =@address.address
        @order.addressee = @address.addressee
      when 3
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.addressee = params[:order][:addressee]
      end
    end

  def complete
  end

  private
  def set_customer
    @customer = current_customer
  end
  def order_params
    params.require(:order).permit(
      :created_at, :address, :addressee, :status, :cash_method, :postcode, :postage,
      order_items_attributes: [:order_id, :product_id, :number, :purchased_price, :status]
      )
  end
end
