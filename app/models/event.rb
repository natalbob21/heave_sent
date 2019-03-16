class Event < ApplicationRecord
  has_one_attached :message
  belongs_to :user
  validates :title, :description, :send_date, :phone, :recipient, presence: true

  after_create :reminder

# Notify our appointment attendee X minutes before the appointment time

def send_event
    account_sid = 'ACd647966387b2d12e22533686a4daed19'
    auth_token = '88eb13a6ddd153ec87b5d72f4382f53c'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    time_str = self.send_date.to_s

    from = '+17866554044' # Your Twilio number
    to = '+19546732891' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Hey friend!"
    )
end


  # def when_to_run
  #   minutes_before_event = 30.minutes
  #   time - minutes_before_appointment
  # end
  #
  # handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
