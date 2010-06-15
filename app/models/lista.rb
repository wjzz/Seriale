# == Schema Information
# Schema version: 20100615195417
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

  validates_presence_of :nazwa
  validates_length_of :dostep, :maximum => 1
end
