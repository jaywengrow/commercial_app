class CreateCommercials < ActiveRecord::Migration
  def self.up
    create_table :commercials do |t|
      t.text :transcript
			t.integer :user_id 
      t.timestamps
    end
    
    add_index :commercials, :user_id
  end

  def self.down
    drop_table :commercials
  end
end
