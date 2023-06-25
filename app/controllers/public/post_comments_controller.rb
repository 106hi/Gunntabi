class Public::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_customer.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render :create
    else
      render :error
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    flash.now[:alert] = 'コメントを削除しました'
    #renderしたときに@postのデータがないので@postを定義
    # @post = Post.find(params[:post_id])
    render :destroy  #render先にjsファイルを指定
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
