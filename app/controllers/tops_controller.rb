class TopsController < ApplicationController
  skip_before_action :login_require

  def index
  end
end
