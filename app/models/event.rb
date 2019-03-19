class Event < ApplicationRecord
  has_one_attached :message
  mount_uploader :video, VideoUploader
  belongs_to :user
  validates :title, :description, :send_date, :phone, :recipient, presence: true

  # after_create :send_event

# Notify our appointment attendee X minutes before the appointment time

<<<<<<< HEAD
#
# def send_event
#   account_sid =  ENV['TWILIO_ACCOUNT_SID']
#   auth_token = ENV['TWILIO_AUTH_TOKEN']
#   @client = Twilio::REST::Client.new(account_sid, auth_token)
#   @message = @client.messages.create(
#    to: "+19546732891",
#    from: ENV['TWILIO_NUMBER'],
#    body: "Hello, it works!"
# )
# end
=======

def send_event
  account_sid =  ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  @message = @client.messages.create(
   to: ENV['PERSONAL_PHONE_NUMBER'],
   from: ENV['TWILIO_NUMBER'],
   body: "Hello, it works!"
)
end
>>>>>>> 0e95d79efae247a5f49be568df35aaa753c8082e

  # def when_to_run
  #   minutes_before_event = 30.minutes
  #   time - minutes_before_appointment
  # end
  #
  # handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
