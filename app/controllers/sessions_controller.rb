class SessionsController < ApplicationController
  skip_before_action :login_require, only: [:new]
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
end