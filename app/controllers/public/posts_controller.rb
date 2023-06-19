class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @post = current_customer.posts.new
  end

  def index
    # エリアごとのリンクを押した時にエリアのページを開く
    if params['area']
      @posts = Post.where(area: params['area'])
    else
      @posts = Post.all
    end
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
    # タグの編集
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end

  def create
    @post = current_customer.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end

  def update
    post = Post.find(params[:id])
    # タグの編集&削除
    tag_list = params[:post][:tag_name].split(',')
    if post.update(post_params)
      # post_idに紐付いていたタグを@oldに入れる
      old_relations = TagMap.where(post_id: post.id)
      # それらを取り出して消す
      old_relations.each do |relation|
        relation.delete
      end
      post.save_tag(tag_list)
      redirect_to post_path(post.id)
    else
      render :edit
    end
  end


  def tag_search

    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end


  def search
    @tag_list = Tag.all
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "public/posts/index"
  end


  private
  def post_params
    params.require(:post).permit(%i[image post_name introduction address area])
  end
end
