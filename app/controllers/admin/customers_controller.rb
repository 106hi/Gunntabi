class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @post = @customer.posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
