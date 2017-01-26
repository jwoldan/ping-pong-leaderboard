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

FactoryGirl.define do
  factory :user, aliases: [:player, :other_player] do
    sequence(:email) { Faker::Internet.email }
    sequence(:password) { Faker::Internet.password }
    sequence(:rating) { Faker::Number.number(3) }
    sequence(:games_played) { Faker::Number.number(2) }
  end
end
