# == Schema Information
# Schema version: 20100613143933
#
# Table name: uzytkowniks
#
#  id         :integer         not null, primary key
#  nazwa      :string(255)
#  email      :string(255)
#  hash_hasla :string(255)
#  rola       :string(1)       default("s")
#  created_at :datetime
#  updated_at :datetime
#

class Uzytkownik < ActiveRecord::Base
  #  attr_accesible :nazwa, :email

  validates_presence_of :nazwa, :email

  validates_length_of   :nazwa, :maximum => 50
  validates_length_of   :email, :maximum => 255

  validates_uniqueness_of :nazwa, :case_sensitive => false
  validates_uniqueness_of :email, :case_sensitive => false
end
