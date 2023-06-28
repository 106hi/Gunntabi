class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.order(created_at: :desc).page(params[:page]).per(6)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id), notice: '編集を保存しました'
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_path, notice: '退会に成功しました'
  end

  private

  def customer_params
    params.require(:customer).permit(%i[first_name last_name nickname phone_number email])
  end
end
