class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @posts = @customer.posts
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path, alert: '投稿を削除しました'
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "admin/posts/index"
  end
end
