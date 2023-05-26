class Public::PostCommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      flash[:notice] = "コメントが空欄です"
      redirect_to post_path(post)
    end
  end
  
  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post_comment.destroy
    redirect_to post_path(@post_comment.post_id)
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
