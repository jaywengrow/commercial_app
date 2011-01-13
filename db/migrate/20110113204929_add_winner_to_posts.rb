class AddWinnerToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :winner, :boolean, :default => false
  end

  def self.down
    remove_column :posts, :winner
  end
end
