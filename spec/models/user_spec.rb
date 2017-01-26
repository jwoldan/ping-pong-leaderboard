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

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:game_1) { FactoryGirl.create(:game) }
  let(:game_2) { FactoryGirl.create(:game) }

  describe "#game_history" do
    it "returns that player's game history" do
      game_1.player = user
      game_1.other_player = other_user
      game_1.save
      game_2.player = other_user
      game_2.other_player = user
      game_2.save

      expect(user.game_history).to include(game_1, game_2)
    end
  end
end
