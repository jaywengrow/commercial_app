class ModifyPosts < ActiveRecord::Migration
  def self.up
  	add_column :posts, :video_id, :string
  	remove_column :posts, :embed_text
  	add_index :posts, :video_id  	
  end

  def self.down
  	remove_column :posts, :video_id
  end
end
