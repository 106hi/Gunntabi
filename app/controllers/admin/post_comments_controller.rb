class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all
  end

  def destroy
    @post_comments = PostComment.all
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
  end
end
