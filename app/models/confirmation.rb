class Confirmation < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :completed]

  before_create :generate_token
  before_update :set_confirmed_at

  def generate_token
   self.token = "#{SecureRandom.hex(4)}-#{SecureRandom.hex(2)}"
  end

  def set_confirmed_at
    self.confirmed_at = Time.now
  end
end
