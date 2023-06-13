class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @posts = @customer.posts
  end
end
