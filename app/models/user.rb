class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :password_digest, :firstname, :lastname, :username

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_create :set_tos_agreed_time


  def set_tos_agreed_time
    self.tos_agreed_at = Time.now
  end
end
