class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :password_digest, :firstname, :lastname, :username
  validates_uniqueness_of :email, on: :create, message: "Email is taken"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_create :set_tos_agreed_time, :generate_refresh_token


  def set_tos_agreed_time
    self.tos_agreed_at = Time.now
  end

  def generate_refresh_token
   self.refresh_token = SecureRandom.hex(80)
  end

  def regenerate_refresh_token
    generate_refresh_token
    self.save(validate: false)
    self.reload
  end
end
