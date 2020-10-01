class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :login_require

  private
  def login_require
    redirect_to sessions_path unless current_user
  end

end
