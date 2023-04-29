class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    @post.save_with(tag_list)
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  #いいねの多い順に投稿を表示
  def ranking
    @ranking_posts = Favorite.group(:post_id).count.sort{|a, b| b.last <=> a.last}.map{|o|Post.find(o.first)}
    @tag_list = Tag.all
  end
  
  #投稿キーワード検索
  def search
    if params[:keyword].present?
      @keyword = params[:keyword]
      @search_posts = Post.search(@keyword)
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @search_posts = @tag.posts.order(created_at: :desc)
    else
      @search_posts = Post.all.order(created_at: :desc)
    end
    
    @tag_list = Tag.all
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :body, :address, :latitude, :longitude)
  end
  
  def tag_list
    params[:post][:tag_names].split(nil)
  end
  
end
