class Event < ApplicationRecord
  has_one_attached :message
  belongs_to :user
  validates :title, :description, :send_date, :send_time, :phone, :recipient, presence: true
end
