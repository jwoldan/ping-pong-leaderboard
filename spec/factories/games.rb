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

FactoryGirl.define do
  factory :game do
    player
    other_player
    sequence(:date) { Faker::Date.between(5.years.ago, Date.today) }
    sequence(:player_score) { Random.rand(25) }
    sequence(:other_player_score) do
      if player_score == 21
        Random.rand(20)
      else
        player_score > 19 ? player_score + 2 : 21
      end
    end
  end
end
