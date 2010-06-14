class CreateAktors < ActiveRecord::Migration
  def self.up
    create_table :aktors do |t|
      t.string :imie
      t.string :nazwisko
      t.string :plec, :limit => 1
      t.date :data_urodzenia

      t.timestamps
    end
  end

  def self.down
    drop_table :aktors
  end
end
