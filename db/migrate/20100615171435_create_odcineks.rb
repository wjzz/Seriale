class CreateOdcineks < ActiveRecord::Migration
  def self.up
    create_table :odcineks do |t|
      t.integer  :numer, :null => false
      t.integer  :sezon, :null => false
      t.datetime :data_emisji
      t.integer  :czas_trwania
      t.integer  :serial_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :odcineks
  end
end
