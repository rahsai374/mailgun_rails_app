class UserMailer < ApplicationMailer

  def send_reminder_email(email)
    @user = User.where(email: email).take
    mail to: email, subject: "Success! You did it."
  end
end
