class AddSendTimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :send_time, :time,  null: false
  end
end
