class AddVoteTotalToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :vote_total, :integer
  end

  def self.down
    remove_column :posts, :vote_total
  end
end
