class Public::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.coments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end

  private

  def post_coment_params
    params.require(:post_comment).permit(:comment)
  end
end
