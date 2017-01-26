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

require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { FactoryGirl.create(:game) }


  describe "#try_set_date" do

    context "when passed an invalid date" do
      it "does not update the date" do
        date = game.date
        game.try_set_date(2016, 2, 30)
        expect(game.date).to eq(date)
      end
    end

    context "when passed a valid date" do
      it "updates the date" do
        new_date = Faker::Date.between(5.years.ago, Date.today)
        while game.date == new_date
          new_date = Faker::Date.between(5.years.ago, Date.today)
        end
        game.try_set_date(new_date.year, new_date.month, new_date.day)
        expect(game.date).to eq(new_date)
      end
    end

  end

  
end
