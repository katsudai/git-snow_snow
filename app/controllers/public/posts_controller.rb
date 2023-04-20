class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @tag_list = Tag.all
  end

  def show
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
  
  private
  
  def post_params
    params.require(:post).permit(:image, :body, :address, :latitude, :longitude)
  end
  
  def tag_list
    params[:post][:tag_names].split(nil)
  end
end
