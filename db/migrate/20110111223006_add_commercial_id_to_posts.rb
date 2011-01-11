class AddCommercialIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :commercial_id, :integer
    add_index :posts, :commercial_id
  end

  def self.down
    remove_column :posts, :commercial_id
  end
end
