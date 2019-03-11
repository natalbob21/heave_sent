class Event < ApplicationRecord
  has_one_attached :message
  belongs_to :user
end
