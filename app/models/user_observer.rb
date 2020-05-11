class UserObserver < ActiveRecord::Observer
  def after_create(user)
    confirmation = Confirmation.create(user: user)
    UserMailer.send_confirmation(confirmation.id).deliver!
  end
end
