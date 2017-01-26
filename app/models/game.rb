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

end
