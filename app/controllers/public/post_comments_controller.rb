class Public::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_customer.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      #flash.now[:notice] = 'コメントを投稿しました'
      # redirect_to post_path(@post)
      #redirect_to post_path(@post), notice: 'コメントを投稿しました'
    else
      flash[:alert] = "コメントを入力してください."
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
