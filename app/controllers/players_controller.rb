class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check, only: [:edit]

  def index
    @q = Player.ransack(params[:q])
    @players = @q.result.includes(:user).page(params[:page]).per(20)
    @check = params[:q]
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = current_user.players.new(player_params)
    if @player.save
      redirect_to user_path(current_user.id), notice: '登録しました'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to user_path(current_user.id), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to user_path(current_user.id), notice: '削除しました'
  end

  private
  def player_params
    params.require(:player).permit(:legend, :platform, :voice_chat, :play_style, :time_to_play, :favorite_weapon, :rank, :killdeath_point, :free)
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def current_user_check
    @player = Player.find(params[:id])
    unless current_user.id == @player.user_id
      redirect_to user_path(current_user.id), notice: '他のユーザーデータは編集できません'
    end
  end
end
