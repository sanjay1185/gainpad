class CreateMetrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|
      t.column :title,:string,:null=>false
      t.column :description,:string
      t.column :pad_id,:integer
      t.column :data_type,:string,:null=>false,:default => 'Integer'
      t.column :prefix,:string
      t.column :postfix,:string
      t.timestamps
    end
  end

  def self.down
    drop_table :metrics
  end
end
