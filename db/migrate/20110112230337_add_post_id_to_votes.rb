class AddPostIdToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :post_id, :integer
    add_index :votes, :post_id
  end

  def self.down
    remove_column :votes, :post_id
  end
end
