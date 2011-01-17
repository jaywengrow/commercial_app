class AddTitleToCommercials < ActiveRecord::Migration
  def self.up
    add_column :commercials, :title, :string
  end

  def self.down
    remove_column :commercials, :title
  end
end
