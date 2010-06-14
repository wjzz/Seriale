class CreateSerials < ActiveRecord::Migration
  def self.up
    create_table :serials do |t|
      t.string :nazwa
      t.text :opis
      t.string :kategoria
      t.string :kanaltv

      t.timestamps
    end

    add_index :serials, :nazwa, :unique => true
  end

  def self.down
    drop_table :serials
  end
end
