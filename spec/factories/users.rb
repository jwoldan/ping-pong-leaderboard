FactoryGirl.define do
  factory :user, aliases: [:player, :other_player] do
    sequence(:email) { Faker::Internet.email }
    sequence(:password) { Faker::Internet.password }
  end
end
