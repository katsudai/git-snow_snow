class Admin::PostCommentsController < ApplicationController
  
  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post_comment.destroy
    redirect_to admin_users_path
  end
end
