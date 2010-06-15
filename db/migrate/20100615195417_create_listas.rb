class CreateListas < ActiveRecord::Migration
  def self.up
    create_table :listas do |t|
      t.string  :nazwa,         :null => false
      t.string  :dostep,        :null => false, :limit => 1, :default => "p"
      t.integer :uzytkownik_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :listas
  end
end
