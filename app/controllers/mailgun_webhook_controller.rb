class MailgunWebhookController < ApplicationController
  require 'csv'

  protect_from_forgery except: :process_mailgun_webhook

  def process_mailgun_webhook
    return unless ["clicked", "bounced"].include? params["event"]
    CSV.open("webhook_data.csv", "a+") do |csv|
      csv << [params["recipient"], params["ip"], params["ip"], params["event"]]
    end
    head 200
  end
end
