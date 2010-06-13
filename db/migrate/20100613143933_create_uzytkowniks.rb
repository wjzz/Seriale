class CreateUzytkowniks < ActiveRecord::Migration
  def self.up
    create_table :uzytkowniks do |t|
      t.string :nazwa
      t.string :email
      t.string :hash_hasla
      t.string :rola, :limit => 1, :default => 's'

      t.timestamps
    end

    add_index :uzytkowniks, :nazwa, :unique => true
    add_index :uzytkowniks, :email, :unique => true
  end

  def self.down
    drop_table :uzytkowniks
  end
end
