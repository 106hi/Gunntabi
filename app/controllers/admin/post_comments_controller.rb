class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    post_comment = PostComment.find(params[:id])
    @post_comments = PostComment.where(post_id: post_comment.post_id)
    post_comment.destroy
    flash.now[:alert] = 'コメントを削除しました'
    render :destroy
  end
end
