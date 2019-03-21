class AddSentAtToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :sent_at, :datetime
  end
end
