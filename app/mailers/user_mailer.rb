class UserMailer < ApplicationMailer

  def send_reminder_email(email)
    @user = User.where(email: email).take
    mail to: email, subject: "Waiting to from you"
  end
end
