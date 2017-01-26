class AddRatingToUser < ActiveRecord::Migration
  def change
    add_column :users, :rating, :integer, null: false, default: 400
    add_index :users, :rating
  end
end
