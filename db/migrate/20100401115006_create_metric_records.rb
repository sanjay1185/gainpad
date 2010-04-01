class CreateMetricRecords < ActiveRecord::Migration
  def self.up
    create_table :metric_records do |t|
      t.column :metric_id,:integer
      t.column :value,:float,:null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :metric_records
  end
end
