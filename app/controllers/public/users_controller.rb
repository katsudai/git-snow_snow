class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :show
    end
  end
  
  def unsubscribe
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to new_user_registration_path
  end
  
  #いいねした投稿を取得
  def favorites
    @user = User.find(params[:id])
    @favorite_posts = @user.favorite_posts
  end
  
  #いいねした投稿のうち、いいね数の多い順に取得
  def ranking
    @user = User.find(params[:id])
    @ranking_posts = @user.favorites.group(:post_id).count.sort{|a, b| b.last <=> a.last}.map{|o|Post.find(o.first)}
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :action_range, :genre, :introduction, :profile_image)
  end
end
