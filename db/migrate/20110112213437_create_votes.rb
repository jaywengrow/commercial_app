class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :value
      t.integer :user_id

      t.timestamps
    end
    add_index :votes, :user_id
  end

  def self.down
    drop_table :votes
  end
end
