# == Schema Information
# Schema version: 20100613143933
#
# Table name: uzytkowniks
#
#  id         :integer         not null, primary key
#  nazwa      :string(255)
#  e_mail     :string(255)
#  hash_hasla :string(255)
#  rola       :string(1)       default("s")
#  created_at :datetime
#  updated_at :datetime
#

class Uzytkownik < ActiveRecord::Base
  #  attr_accesible :nazwa, :email

  validates_presence_of :nazwa, :email
end
