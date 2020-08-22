class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@customers = Customer.all.page(params[:page])
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "#{@customer.family_name+@customer.family_rubi}さんの会員情報を編集しました"
      redirect_to admin_customers_path
    else
      render 'edit'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name,:family_rubi,:first_name,:first_rubi,:postcode,:address,:tell,:email,:status)
  end
end
