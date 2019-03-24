class Event < ApplicationRecord
  has_one_attached :message
  mount_uploader :video, VideoUploader
  belongs_to :user
  belongs_to :recipient
  validates :title, :description, :send_date, :recipient_id, presence: true
  before_create :assign_uuid


def assign_uuid
  self.uuid = SecureRandom.uuid
end

def send_event
  account_sid =  ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  @message = @client.messages.create(
   to: "+1#{recipient.phone}",
   from: ENV['TWILIO_NUMBER'],
   body: "Hello, #{recipient.name}!.  Heaven Sent you a message from #{user.email}...  To view it, click here: #{Rails.env.development? ? 'http://localhost:3000' : 'https://' + ENV['HOST_URL']}/public_events/#{self.uuid}."
)
end

end
