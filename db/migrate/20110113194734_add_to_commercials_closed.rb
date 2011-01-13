class AddToCommercialsClosed < ActiveRecord::Migration
  def self.up
  	add_column :commercials, :closed, :boolean, :default => false
  end

  def self.down
  	remove_column :commercials, :closed
  end
end
