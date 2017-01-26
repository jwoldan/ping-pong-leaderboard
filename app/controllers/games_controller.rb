class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.player = current_user
    @game.date = Date.new(
      params[:game][:year].to_i,
      params[:game][:month].to_i,
      params[:game][:day].to_i
    )
    if @game.save
      @game.update_player_ratings
      redirect_to "/"
    else
      render :new
    end
  end

  private

  def game_params
    params
      .require(:game)
      .permit(
        :player_id,
        :other_player_id,
        :player_score,
        :other_player_score
      )
  end


end
