class AddRecipientRefToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :recipient, foreign_key: true
  end
end
