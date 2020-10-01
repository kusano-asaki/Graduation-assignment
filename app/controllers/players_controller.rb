class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player), notice: '登録しました'
    else
      render :new
    end

  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to player_path(@player), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path, notice: '削除しました'
  end

  private
  def player_params
    params.require(:player).permit(:legend, :platform, :voice_chat, :play_style, :time_to_play, :favorite_weapon, :rank, :killdeath_point, :free)
  end
end
