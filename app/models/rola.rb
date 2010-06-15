# == Schema Information
# Schema version: 20100615142437
#
# Table name: rolas
#
#  id               :integer         not null, primary key
#  serial_id        :integer
#  aktor_id         :integer
#  imie_postaci     :string(255)
#  nazwisko_postaci :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Rola < ActiveRecord::Base
  belongs_to :aktor
  belongs_to :serial
end
