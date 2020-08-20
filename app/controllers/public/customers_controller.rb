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
  end

  def withdraw
  end

  private
    def customer_params
       params.require(:customer).permit(:family_name, :first_name, :family_rubi, :first_rubi, :email, :postcode, :address, :tell)
    end

end
