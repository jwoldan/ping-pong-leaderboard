FactoryGirl.define do
  factory :game do
    player
    other_player
    sequence(:date) { Faker::Date.between(5.years.ago, Date.today) }
    sequence(:player_score) { Random.rand(22) }
    sequence(:other_player_score) { Random.rand(3) + 21 }
  end
end
