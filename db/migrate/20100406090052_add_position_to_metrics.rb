class AddPositionToMetrics < ActiveRecord::Migration
  def self.up
    add_column :metrics, :position, :integer
  end

  def self.down
    remove_column :metrics, :position
  end
end
