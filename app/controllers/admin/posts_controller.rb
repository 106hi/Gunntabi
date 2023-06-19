class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @posts = @customer.posts
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "admin/posts/index"
  end
end
