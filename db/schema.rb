# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100618080446) do

  create_table "aktors", :force => true do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "plec",           :limit => 1
    t.date     "data_urodzenia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assocs", :force => true do |t|
    t.integer  "lista_id",   :null => false
    t.integer  "serial_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listas", :force => true do |t|
    t.string   "nazwa",                                       :null => false
    t.string   "dostep",        :limit => 1, :default => "p", :null => false
    t.integer  "uzytkownik_id",                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ocenas", :force => true do |t|
    t.integer  "serial_id"
    t.integer  "uzytkownik_id"
    t.integer  "wartosc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "odcineks", :force => true do |t|
    t.integer  "numer",        :null => false
    t.integer  "sezon",        :null => false
    t.datetime "data_emisji"
    t.integer  "czas_trwania"
    t.integer  "serial_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tytul"
  end

  create_table "rolas", :force => true do |t|
    t.integer  "serial_id"
    t.integer  "aktor_id"
    t.string   "imie_postaci"
    t.string   "nazwisko_postaci"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rolas", ["aktor_id"], :name => "index_rolas_on_aktor_id"
  add_index "rolas", ["serial_id"], :name => "index_rolas_on_serial_id"

  create_table "serials", :force => true do |t|
    t.string   "nazwa"
    t.text     "opis"
    t.string   "kategoria"
    t.string   "kanaltv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "serials", ["nazwa"], :name => "index_serials_on_nazwa", :unique => true

  create_table "uzytkowniks", :force => true do |t|
    t.string   "nazwa"
    t.string   "email"
    t.string   "hash_hasla"
    t.string   "rola",       :limit => 1, :default => "s"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uzytkowniks", ["email"], :name => "index_uzytkowniks_on_email", :unique => true
  add_index "uzytkowniks", ["nazwa"], :name => "index_uzytkowniks_on_nazwa", :unique => true

end
