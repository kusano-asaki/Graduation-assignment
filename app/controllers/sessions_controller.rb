class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && User.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to players_path, notice: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
end
