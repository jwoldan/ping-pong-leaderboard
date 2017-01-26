class AddGamesPlayedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :games_played, :integer, null: false, default: 0
  end
end
