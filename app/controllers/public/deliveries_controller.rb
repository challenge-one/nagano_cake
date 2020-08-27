class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to public_deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries.all
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to public_deliveries_path
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to public_deliveries_path
  end

  private
    def delivery_params
      params.require(:delivery).permit(:postcode,:address,:addressee)
    end

end
