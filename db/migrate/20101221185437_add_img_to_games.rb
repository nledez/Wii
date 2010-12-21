class AddImgToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :img_url, :string
  end

  def self.down
    remove_column :games, :img_url
  end
end
