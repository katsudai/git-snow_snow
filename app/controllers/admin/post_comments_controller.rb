class Admin::PostCommentsController < ApplicationController
  
  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post_comment.destroy
    redirect_to admin_post_path(@post_comment.post_id)
  end
end
