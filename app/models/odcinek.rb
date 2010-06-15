class Odcinek < ActiveRecord::Base
  validates_presence_of :numer, :serial_id, :sezon
  validates_numericality_of :numer, :greater_than_or_equal_to => 0
#  validates_numericality_of :czas_trwania, :greater_than => 0
  belongs_to :serial
end
