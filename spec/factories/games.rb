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
    sequence(:player_score) { Random.rand(22) }
    sequence(:other_player_score) { Random.rand(3) + 21 }
  end
end
