# == Schema Information
# Schema version: 20100615184953
#
# Table name: ocenas
#
#  id            :integer         not null, primary key
#  serial_id     :integer
#  uzytkownik_id :integer
#  wartosc       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Ocena < ActiveRecord::Base
  belongs_to :uzytkownik
  belongs_to :serial

  validates_presence_of     :wartosc, :serial_id, :uzytkownik_id

  validates_numericality_of :wartosc, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10
end
