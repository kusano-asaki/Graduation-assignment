class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :login_require

  private
  def login_require
    unless current_user
    redirect_to new_session_path
    flash[:notice] = "アプリをご利用になるにはログインしてください"
    end
  end

end
