class CreateUzytkowniks < ActiveRecord::Migration
  def self.up
    create_table :uzytkowniks do |t|
      t.string :nazwa
      t.string :e_mail
      t.string :hash_hasla
      t.string :rola

      t.timestamps
    end
  end

  def self.down
    drop_table :uzytkowniks
  end
end
