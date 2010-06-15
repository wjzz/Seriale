class CreateOcenas < ActiveRecord::Migration
  def self.up
    create_table :ocenas do |t|
      t.integer :serial_id
      t.integer :uzytkownik_id
      t.integer :wartosc

      t.timestamps
    end
  end

  def self.down
    drop_table :ocenas
  end
end
