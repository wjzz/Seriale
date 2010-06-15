class Ocena < ActiveRecord::Base
  belongs_to :uzytkownik
  belongs_to :serial
end
