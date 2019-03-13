class Event < ApplicationRecord
  has_one_attached :message
  belongs_to :user
  validates :title, :description, :send_date, presence: true
end
