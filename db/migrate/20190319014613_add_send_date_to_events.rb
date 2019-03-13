class AddSendDateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :send_date, :date, null: false
  end
end
