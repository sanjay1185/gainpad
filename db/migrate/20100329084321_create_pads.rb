class CreatePads < ActiveRecord::Migration
  def self.up
    create_table :pads do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :pads
  end
end
