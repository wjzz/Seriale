# == Schema Information
# Schema version: 20100618080446
#
# Table name: odcineks
#
#  id           :integer         not null, primary key
#  numer        :integer         not null
#  sezon        :integer         not null
#  data_emisji  :datetime
#  czas_trwania :integer
#  serial_id    :integer         not null
#  created_at   :datetime
#  updated_at   :datetime
#  tytul        :string(255)
#

class Odcinek < ActiveRecord::Base
  validates_presence_of :numer, :serial_id, :sezon
  validates_numericality_of :numer, :greater_than_or_equal_to => 0
#  validates_numericality_of :czas_trwania, :greater_than => 0
  belongs_to :serial
end
