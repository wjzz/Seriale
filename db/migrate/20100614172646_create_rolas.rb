class CreateRolas < ActiveRecord::Migration
  def self.up
    create_table :rolas do |t|
      t.integer  :serial_id
      t.integer  :aktor_id
      t.string   :imie_postaci
      t.string   :nazwisko_postaci

      t.timestamps
    end

    add_index :rolas, :serial_id
    add_index :rolas, :aktor_id
  end

  def self.down
    drop_table :rolas
  end
end
