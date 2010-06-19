# == Schema Information
# Schema version: 20100618080446
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

require 'digest'
class Uzytkownik < ActiveRecord::Base
  attr_accessor :password
#  attr_accessible :nazwa, :email, :rola, :password, :password_confirmation

  validates_presence_of :nazwa, :email

  validates_length_of   :nazwa, :maximum => 50
  validates_length_of   :email, :maximum => 255

  validates_uniqueness_of :nazwa, :case_sensitive => false
  validates_uniqueness_of :email, :case_sensitive => false

  validates_confirmation_of :password

  #validates_presence_of :password
  #validates_length_of   :password, :within => 6..40

  before_save :encrypt_password

  has_many :ocenas
  has_many :serials, :through => :ocenas
  has_many :listas

  def has_password?(submitted_password)
    hash_hasla == encrypt(submitted_password)
  end

  def admin?
    rola == 'a'
  end

  def moderator?
    rola == 'm'
  end

  def standard?
    rola == 's'
  end

  def Uzytkownik.authenticate(nazwa, submitted_password)
    user = Uzytkownik.find_by_nazwa(nazwa)

    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private
    def encrypt_password
      unless password.nil?
        self.hash_hasla = encrypt(password)
      end
    end

    def encrypt(string)
      secure_hash(string)
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
