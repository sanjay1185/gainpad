class AddUserIdToPads < ActiveRecord::Migration
  def self.up
    add_column :pads,:user_id,:integer
  end

  def self.down
    remove_column :pads,:user_id
  end
end
