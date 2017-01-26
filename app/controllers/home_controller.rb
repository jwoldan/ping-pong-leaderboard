class HomeController < ApplicationController

  def index
    @users = User.users_by_rating
  end

  def history
    @games = current_user.game_history
  end

end
