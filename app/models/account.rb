require 'digest/sha2'
class Account < ApplicationRecord
  has_one :user, :dependent => :destroy
  has_many :feedbacks, :dependent => :destroy
  validates :username, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  validates :username, :password, length: 8..32
  attr_accessor :passwordConfirmation
  attr_reader :password
  validate :passwordMustBePresent
  def Account.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + salt)
  end
  def password=(password)
    @password = password
    if password.present?
      generateSalt
      self.hash_password = self.class.encrypt_password(password, salt)
    end
  end
  private
  def passwordMustBePresent
    if hash_password.present? == false
      errors.add(:base, 'Mật khẩu không trùng khớp!')
    end
  end
  def generateSalt
    self.salt = self.object_id.to_s + rand.to_s
  end
  def Account.authenticate(username, password)
    if account = find_by_username(username)
      if account.hash_password == encrypt_password(password, account.salt)
        account
      end
    end
  end
end