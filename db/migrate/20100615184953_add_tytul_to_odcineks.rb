class AddTytulToOdcineks < ActiveRecord::Migration
  def self.up
    add_column :odcineks, :tytul, :string
  end

  def self.down
    remove_column :odcineks, :tytul
  end
end
