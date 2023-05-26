class Public::UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    
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
      flash[:notice] = "名前またはメールアドレスが未入力です"
      render :edit
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
    @room = Room.new
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :action_range, :genre_id, :introduction, :profile_image)
  end
end
