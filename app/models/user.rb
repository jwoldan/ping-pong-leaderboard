# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  rating                 :integer          default(400), not null
#  games_played           :integer          default(0), not null
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :entered_games,
    class_name: 'Game',
    foreign_key: :player_id

  has_many :received_games,
    class_name: 'Game',
    foreign_key: :other_player_id

  def self.users_by_rating
    User.order('rating DESC')
  end

  def game_history
    Game
      .where("games.player_id = ? OR games.other_player_id = ?", id, id)
      .order("date DESC")
  end

end
