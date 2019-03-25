class Recipient < ApplicationRecord
    belongs_to :user
    has_many :events, dependent: :destroy   
    validates :name, :phone, presence: true  

    after_destroy :destroy_events

    private

    def destroy_events
        self.events.destroy_all
    end
end
