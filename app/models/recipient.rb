class Recipient < ApplicationRecord
    belongs_to :user
    has_many :events  
    validates :name, :phone, presence: true  
end
