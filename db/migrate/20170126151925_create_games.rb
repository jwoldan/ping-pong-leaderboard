class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_id, null: false
      t.integer :other_player_id, null: false
      t.integer :player_score, null: false
      t.integer :other_player_score, null: false
      t.date :date, null: false

      t.timestamps null: false
    end
    add_index :games, :player_id
    add_index :games, :other_player_id
  end
end
