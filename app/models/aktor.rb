# == Schema Information
# Schema version: 20100614172646
#
# Table name: aktors
#
#  id             :integer         not null, primary key
#  imie           :string(255)
#  nazwisko       :string(255)
#  plec           :string(1)
#  data_urodzenia :date
#  created_at     :datetime
#  updated_at     :datetime
#

class Aktor < ActiveRecord::Base
  has_many :rolas
  has_many :serials, :through => :rolas #, :uniq => true
end
