class UsersController < ApplicationController
  skip_before_action :login_require
  before_action :new_login_check, only: [:new]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @players = @user.players
  end

  def follow
    @user = User.find(params[:id])
    if @user == current_user
      @following_users = @user.following
      @followers_users = @user.followers
      # binding.pry
      render 'show_follow'
    else
      redirect_to user_path(current_user.id), notice: '他のユーザーのフォロー/フォロワーリストへはアクセスできません'
    end
  end

  def create
    @user = User.new(user_params)
    @user.password_confirmation = user_params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'user登録,ログインしました'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def new_login_check
    if current_user
      redirect_to  user_path(@current_user.id), notice: 'ログインずみのためアクセスできません'
    end
  end

end
