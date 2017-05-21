module Mailgun

  def send_email(email="rahul12345@yopmail.com")
    mg_client = Mailgun::Client.new("key-c98c102594e10cd2d2e41099edf3e88b")
    message_params =  {
                     from: 'rahul@mailgun_rails.com',
                     to:   email,
                     subject: 'Hello!!',
                     text:    'We are really excited to get you onboard on out platform.'
                    }
    result = mg_client.send_message('sandbox52762ccd483f408f838b304f86689bd7.mailgun.org', message_params).to_h!
    message_id = result['id']
    message = result['message']
  end

  def fetch_emails(email="rahul12345@yopmail.com")
    mg_client = Mailgun::Client.new("key-c98c102594e10cd2d2e41099edf3e88b")
    mg_events = Mailgun::Events.new(mg_client, "sandbox52762ccd483f408f838b304f86689bd7.mailgun.org")
    result = mg_events.get({'recipient' => email})
    result.to_h['items'].each do | item |
      # outputs "Delivered - 20140509184016.12571.48844@example.com"
      puts "#{item['event']} - #{item['message']['headers']['message-id']}"
    end
  end

  def check_suppression_list(email="rahul12345@yopmail.com")
    bounce = RestClient.get("https://api:key-c98c102594e10cd2d2e41099edf3e88b"\
                 "@api.mailgun.net/v3/sandbox52762ccd483f408f838b304f86689bd7.mailgun.org/bounces"\
                 "/#{email}"){|response, request, result| response }
    unsubscribe = RestClient.get("https://api:key-c98c102594e10cd2d2e41099edf3e88b"\
                 "@api.mailgun.net/v3/sandbox52762ccd483f408f838b304f86689bd7.mailgun.org/unsubscribes"\
                 "/#{email}"){|response, request, result| response }
    complaint = RestClient.get("https://api:key-c98c102594e10cd2d2e41099edf3e88b"\
                 "@api.mailgun.net/v3/sandbox52762ccd483f408f838b304f86689bd7.mailgun.org/unsubscribes"\
                 "/#{email}"){|response, request, result| response }
  return [bounce.code, unsubscribe.code, complaint.code].include? 200
  end
end
