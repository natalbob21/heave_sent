class Event < ApplicationRecord
  has_one_attached :message
  has_one_attached :audio
  has_one_attached :video
  
  belongs_to :user
  validates :title, :description, :send_date, :phone, :recipient, presence: true

  after_create :reminder

# Notify our appointment attendee X minutes before the appointment time

def send_event
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    time_str = self.send_date.to_s

    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = self.phone # Your mobile phone number

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
