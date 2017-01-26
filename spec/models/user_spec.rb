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
