class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to customer_path(customer.id)
    else
      render :edit
    end
  end

  def confirm

  end

  private
  def customer_params
    params.require(:customer).permit(%i[first_name last_name nickname phone_number email profile])
  end
end
