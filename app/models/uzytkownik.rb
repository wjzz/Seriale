# == Schema Information
# Schema version: 20100613143933
#
# Table name: uzytkowniks
#
#  id         :integer         not null, primary key
#  nazwa      :string(255)
#  e_mail     :string(255)
#  hash_hasla :string(255)
#  rola       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Uzytkownik < ActiveRecord::Base
end
