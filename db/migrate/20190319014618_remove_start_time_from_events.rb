class RemoveStartTimeFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :send_time
  end
end
