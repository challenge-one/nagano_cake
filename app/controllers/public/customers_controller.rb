class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer.id
  end

  def edit
    @customer = current_customer
    #@customer = Customer.find_by(id: :customer_id)
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_path, notice: "successfully updated user!"
    else
      render "edit"
    end
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


end
