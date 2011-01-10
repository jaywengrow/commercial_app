class AddBusinessUserToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :business_user, :boolean, :default => false
  end

  def self.down
    remove_column :users, :business_user
  end
end
