class SessionsController < ApplicationController
  skip_before_action :login_require
  before_action :new_login_check, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to players_path, notice: 'ログインしました'
    else
      flash[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: 'ログアウトしました'
  end

  private
  def new_login_check
    if current_user
      redirect_to  user_path(@current_user.id), notice: 'ログインずみのためアクセスできません'
    end
  end
end
