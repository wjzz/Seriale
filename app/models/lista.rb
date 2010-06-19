# == Schema Information
# Schema version: 20100618080446
#
# Table name: listas
#
#  id            :integer         not null, primary key
#  nazwa         :string(255)     not null
#  dostep        :string(1)       default("p"), not null
#  uzytkownik_id :integer         not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Lista < ActiveRecord::Base
  belongs_to :uzytkownik

  has_many :assocs
  has_many :serials, :through => :assocs

  validates_presence_of :nazwa
  validates_length_of :dostep, :maximum => 1
end
