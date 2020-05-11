class UserMailer < ApplicationMailer

  def send_confirmation(confirmation_id)
    @confirmation = Confirmation.find(confirmation_id)
    @user = @confirmation.user
    send_mail(to: @user.email, subject: "Please confirm your email")
  end
end
