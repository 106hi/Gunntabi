class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:favorites]

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

  def favorites
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private
  def customer_params
    params.require(:customer).permit(%i[first_name last_name nickname phone_number email profile])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
