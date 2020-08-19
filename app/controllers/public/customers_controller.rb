class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(status:1)
    reset_session
    redirect_to root_path
  end

  def customer_params
      params.require(:customer).permit(:status)
  end

end
