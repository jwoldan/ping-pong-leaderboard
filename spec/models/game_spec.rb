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
  pending "add some examples to (or delete) #{__FILE__}"
end
