class AddUserIdToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :user_id, :integer
    Game.update_all ["user_id = ?", 1]
  end

  def self.down
    remove_column :games, :user_id
  end
end
