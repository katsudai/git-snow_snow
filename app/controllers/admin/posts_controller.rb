class Admin::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_users_path
  end
end
