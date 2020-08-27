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
        @order.cash_method = params[:order][:cash_method].to_i
        @cart_items = current_customer.cart_items
        total = 0
        @cart_items.each do |cart_item|
        total += cart_item.product.price * 1.10 * cart_item.number
      end
        @order.total_amount = total
        @add = params[:order][:address].to_i

      case @add
      when @add == 1
        @order.postcode = @customer.postcode
        @order.address = @customer.address
        @order.addressee = @customer.addressee
      when @add == 2
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.addressee = params[:order][:addressee]
      when @add == 3
        address = Address.new(address_params)
        address.customer_id = current_customer.id
        address.save
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.addressee = params[:order][:addressee]
      end
        @order.save

        current_customer.cart_items.each do |cart_item|
        order_item = @order.order_items.build
        order_item.order_id = @order.id
        order_item.product_id = cart_item.product_id
        order_item.number = cart_item.number
        order_item.purchased_price = cart_item.product.price
        order_item.save
        cart_item.destroy
      end

        render :complete
    
      else
        flash[:notice] = "カートの中身がありません"
        redirect_to public_cart_items_path
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
        @order.cash_method = params[:order][:cash_method]
        @cart_items = current_customer.cart_items
        @add = params[:order][:@add].to_i
      if @add.to_i == 1
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.addressee = current_customer.family_name
      elsif @add.to_i == 2
        @sta = params[:order][:id].to_i
        @address = Delivery.find(@sta)
        @order.address = @address.address
        @order.postcode = @address.postcode
        @order.addressee = @address.addressee
      elsif @add.to_i == 3
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
      :total_amount,:created_at, :address, :addressee, :status, :cash_method, :postcode, :postage,
      order_items_attributes: [:order_id, :product_id, :number, :purchased_price, :status])
    end

    def address_params
      params.require(:address).permit(
      :customer_id, :postcode, :address, :addressee)
      end
    end
