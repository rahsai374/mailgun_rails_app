class DayilCronWorker
  include Sidekiq::Worker

  def perform(*args)
    send_reminder_for_unconfirmed_account
  end

  private

    def send_reminder_for_unconfirmed_account
      start_date = (Time.zone.now - 1.days).beginning_of_day
      end_date = Time.zone.now#(Time.zone.now - 2.days).end_of_day
      User.pending_confirmation(start_date, end_date).each do  |user|
        UserMailer.send_reminder_email(user.email).deliver
      end
    end
end
