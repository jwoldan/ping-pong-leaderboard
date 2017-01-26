class GamesController < ApplicationController

  def new
    @opponents = User.where.not(id: current_user.id)
    @months = Game::MONTHS
    today = Date.today
    @current_month = today.month
    @current_day = today.day
    @current_year = today.year
    render :new
  end

  def create
  end

  private

  def game_params
    params
      .require(:game)
      .permit(
        :player_id,
        :other_player_id,
        :player_score,
        :other_player_score,
        :month,
        :day,
        :year
      )
  end


end
