class Admin::PostCommentsController < ApplicationController
  def index
    @post_comments = PostComment.all
  end

  def destroy
    @post_comments = PostComment.all
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
  end
end
