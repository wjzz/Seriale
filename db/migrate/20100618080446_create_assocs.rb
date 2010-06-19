class CreateAssocs < ActiveRecord::Migration
  def self.up
    create_table :assocs do |t|
      t.integer :lista_id, :null => false
      t.integer :serial_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :assocs
  end
end
