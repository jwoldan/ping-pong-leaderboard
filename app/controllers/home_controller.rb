class HomeController < ApplicationController
  def index
  end

  def history
    @games = current_user.game_history
  end

end
