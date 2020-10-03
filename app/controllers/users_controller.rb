class UsersController < ApplicationController
  skip_before_action :login_require

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @players = @user.players
  end

  def follow
    @user = User.find(params[:id])
    @following_users = @user.following
    @followers_users = @user.followers
    render 'show_follow'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'user登録しました'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
