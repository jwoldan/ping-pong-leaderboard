# == Schema Information
#
# Table name: games
#
#  id                 :integer          not null, primary key
#  player_id          :integer          not null
#  other_player_id    :integer          not null
#  player_score       :integer          not null
#  other_player_score :integer          not null
#  date               :date             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Game < ActiveRecord::Base

  JANUARY = 'January'.freeze
  FEBRUARY = 'February'.freeze
  MARCH = 'March'.freeze
  APRIL = 'April'.freeze
  MAY = 'May'.freeze
  JUNE = 'June'.freeze
  JULY = 'July'.freeze
  AUGUST = 'August'.freeze
  SEPTEMBER = 'September'.freeze
  OCTOBER = 'October'.freeze
  NOVEMBER = 'November'.freeze
  DECEMBER = 'December'.freeze

  MONTHS = [
    JANUARY,
    FEBRUARY,
    MARCH,
    APRIL,
    MAY,
    JUNE,
    JULY,
    AUGUST,
    SEPTEMBER,
    OCTOBER,
    NOVEMBER,
    DECEMBER
  ].freeze

  validates :player_id,
            :other_player_id,
            :player_score,
            :other_player_score,
            :date,
            presence: true

  validate :valid_score

  belongs_to :player,
    class_name: 'User'

  belongs_to :other_player,
    class_name: 'User'

  private

  def valid_score
    if (player_score.nil? || other_player_score.nil?) ||
        (player_score < 21 && other_player_score < 21) ||
        (player_score - other_player_score).abs < 2
      errors.add(:player_score, "Not a valid final score")
      errors.add(:other_player_score, "Not a valid final score")
    end
  end

end
