# == Schema Information
# Schema version: 20100615171435
#
# Table name: serials
#
#  id         :integer         not null, primary key
#  nazwa      :string(255)
#  opis       :text
#  kategoria  :string(255)
#  kanaltv    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Serial < ActiveRecord::Base
  validates_presence_of   :nazwa
  validates_length_of     :nazwa, :maximum => 255
  validates_uniqueness_of :nazwa, :case_sensitive => false

  has_many :rolas
  has_many :aktors, :through => :rolas

  has_many :ocenas
  has_many :uzytkowniks, :through => :ocenas

  has_many :odcineks
end
