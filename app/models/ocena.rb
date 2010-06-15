# == Schema Information
# Schema version: 20100615142437
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

  validates_presence_of :wartosc, :serial_id, :uzytkownik_id
end
