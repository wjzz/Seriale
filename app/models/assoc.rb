# == Schema Information
# Schema version: 20100618080446
#
# Table name: assocs
#
#  id         :integer         not null, primary key
#  lista_id   :integer         not null
#  serial_id  :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

class Assoc < ActiveRecord::Base
  belongs_to :serial
  belongs_to :lista

  validates_presence_of :serial_id, :lista_id
end
